#######################################################################################
#
#	Copy Right : ZSoft R&D
#
#######################################################################################

MACRO(ZS_BUILDER_VERSION_GREATER MAJOR_VER MINOR_VER PATCH_VER)
	SET(ZS_VALID_BUILDER_VERSION OFF)
	IF(CMAKE_MAJOR_VERSION GREATER ${MAJOR_VER})
		SET(ZS_VALID_BUILDER_VERSION ON)
	ELSEIF(CMAKE_MAJOR_VERSION EQUAL ${MAJOR_VER})
		IF(CMAKE_MINOR_VERSION GREATER ${MINOR_VER})
			SET(ZS_VALID_BUILDER_VERSION ON)
		ELSEIF(CMAKE_MINOR_VERSION EQUAL ${MINOR_VER})
			IF(CMAKE_PATCH_VERSION GREATER ${PATCH_VER})
				SET(ZS_VALID_BUILDER_VERSION ON)
			ENDIF(CMAKE_PATCH_VERSION GREATER ${PATCH_VER})
		ENDIF()
	ENDIF()
ENDMACRO(ZS_BUILDER_VERSION_GREATER MAJOR_VER MINOR_VER PATCH_VER)

MACRO(ZS_SETUP_TARGET_CONFIG_DEFINITIONS _ZS_TARGET_NAME _TARGET_TYPE)
	SET(_ZS_CONFIG_DEFINITIONS_GENERATOR "$<1:${ZS_${_TARGET_TYPE}_GENERAL_DEFINITIONS}>")
	LIST(LENGTH ZS_GLOBAL_CONFIGUATION_TYPES _ZS_LIST_LEN)
	FOREACH(i RANGE ${_ZS_LIST_LEN})
		IF(${i} EQUAL ${_ZS_LIST_LEN})
			BREAK()
		ENDIF()
		LIST(GET ZS_GLOBAL_CONFIGUATION_TYPES ${i} _ZS_CONF)
		STRING(TOUPPER ${_ZS_CONF} _ZS_CONF)
		SET(_ZS_ITEM "$<$<CONFIG:${_ZS_CONF}>:${ZS_${_TARGET_TYPE}_DEFINITIONS_${_ZS_CONF}}>")
		SET(_ZS_CONFIG_DEFINITIONS_GENERATOR "${_ZS_CONFIG_DEFINITIONS_GENERATOR};${_ZS_ITEM}")
	ENDFOREACH()
	SET_PROPERTY(TARGET ${_ZS_TARGET_NAME} APPEND PROPERTY COMPILE_DEFINITIONS ${_ZS_CONFIG_DEFINITIONS_GENERATOR})
ENDMACRO(ZS_SETUP_TARGET_CONFIG_DEFINITIONS _ZS_TARGET_NAME _TARGET_TYPE)

MACRO(ZS_SETUP_TARGET_CONFIG_COMPILE_OPTIONS _ZS_TARGET_NAME _TARGET_TYPE)
	SET(_ZS_CONFIG_COMPILE_OPTIONS_GENERATOR "$<1:${ZS_${_TARGET_TYPE}_GENERAL_COMPILE_OPTIONS}>")
	LIST(LENGTH ZS_GLOBAL_CONFIGUATION_TYPES _ZS_LIST_LEN)
	FOREACH(i RANGE ${_ZS_LIST_LEN})
		IF(${i} EQUAL ${_ZS_LIST_LEN})
			BREAK()
		ENDIF()
		LIST(GET ZS_GLOBAL_CONFIGUATION_TYPES ${i} _ZS_CONF)
		STRING(TOUPPER ${_ZS_CONF} _ZS_CONF)
		SET(_ZS_ITEM "$<$<CONFIG:${_ZS_CONF}>:${ZS_${_TARGET_TYPE}_COMPILE_OPTIONS_${_ZS_CONF}}>")
		SET(_ZS_CONFIG_COMPILE_OPTIONS_GENERATOR "${_ZS_CONFIG_COMPILE_OPTIONS_GENERATOR};${_ZS_ITEM}")
	ENDFOREACH()
	SET_PROPERTY(TARGET ${_ZS_TARGET_NAME} APPEND PROPERTY COMPILE_OPTIONS ${_ZS_CONFIG_COMPILE_OPTIONS_GENERATOR})
ENDMACRO(ZS_SETUP_TARGET_CONFIG_COMPILE_OPTIONS _ZS_TARGET_NAME _TARGET_TYPE)

MACRO(ZS_SETUP_TARGET_CONFIG_LINK_FLAGS _ZS_TARGET_NAME _TARGET_TYPE)
	SET_PROPERTY(TARGET ${_ZS_TARGET_NAME} PROPERTY LINK_FLAGS ${ZS_${_TARGET_TYPE}_GENERAL_LINK_FLAGS})
	FOREACH(_ZS_CONF ${ZS_GLOBAL_CONFIGUATION_TYPES})
		STRING(TOUPPER ${_ZS_CONF} _ZS_CONF)
		SET_PROPERTY(TARGET ${_ZS_TARGET_NAME} PROPERTY LINK_FLAGS_${_ZS_CONF} ${ZS_${_TARGET_TYPE}_LINK_FLAGS_${_ZS_CONF}})
	ENDFOREACH()
ENDMACRO(ZS_SETUP_TARGET_CONFIG_LINK_FLAGS _ZS_TARGET_NAME _TARGET_TYPE)

MACRO(ZS_VAR_CONFIG_GENERATOR_EXPRESSION _ZS_INPUT_VAR_NAME _ZS_OUTPUT_VAR_NAME)
	SET(${_ZS_OUTPUT_VAR_NAME} "")
	LIST(LENGTH ZS_GLOBAL_CONFIGUATION_TYPES _ZS_LIST_LEN)
	FOREACH(i RANGE ${_ZS_LIST_LEN})
		IF(${i} EQUAL ${_ZS_LIST_LEN})
			BREAK()
		ENDIF()
		LIST(GET ZS_GLOBAL_CONFIGUATION_TYPES ${i} _ZS_CONF)
		STRING(TOUPPER ${_ZS_CONF} _ZS_CONF)
		SET(_ZS_ITEM "$<$<CONFIG:${_ZS_CONF}>:${${_ZS_INPUT_VAR_NAME}_${_ZS_CONF}}>")
		SET(${_ZS_OUTPUT_VAR_NAME} "${${_ZS_OUTPUT_VAR_NAME}};${_ZS_ITEM}")
	ENDFOREACH()
ENDMACRO(ZS_VAR_CONFIG_GENERATOR_EXPRESSION _ZS_INPUT_VAR_NAME _ZS_OUTPUT_VAR_NAME)

MACRO(ZS_SETUP_APPLICATION)
	IF(ZS_APPLICATION_MOC_SRCS)
		FOREACH(moc_src ${ZS_APPLICATION_MOC_SRCS})
			QT5_WRAP_CPP(_ZS_APPLICATION_MOC_CPP ${moc_src} OPTIONS -f${moc_src} OPTIONS -DHAVE_QT5)
		ENDFOREACH()
	ENDIF()

	QT5_WRAP_UI(_ZS_APPLICATION_UI_CPP ${ZS_APPLICATION_UI_FORMS})

	IF(DEFINED ZS_APPLICATION_RESOURCES)
		QT5_ADD_RESOURCES(_ZS_APPLICATION_QRC_SRCS ${ZS_APPLICATION_RESOURCES})
	ENDIF()

	ADD_EXECUTABLE(${ZS_APPLICATION_NAME}
		${ZS_APPLICATION_INCLUDE}
		${ZS_APPLICATION_INC}
		${ZS_APPLICATION_SRC}
		${_ZS_APPLICATION_MOC_CPP}
		${_ZS_APPLICATION_UI_CPP}
		${_ZS_APPLICATION_QRC_SRCS}
	)
	SOURCE_GROUP("include" FILES ${ZS_APPLICATION_INCLUDE})
	SOURCE_GROUP("inc" FILES ${ZS_APPLICATION_INC})
	SOURCE_GROUP("src" FILES ${ZS_APPLICATION_SRC})
	
	SOURCE_GROUP("Resources" 
		FILES
		${ZS_APPLICATION_RESOURCES}
		${ZS_APPLICATION_UI_FORMS}
    )

	SOURCE_GROUP("Generated" 
		FILES
		${_ZS_APPLICATION_MOC_CPP}
		${_ZS_APPLICATION_UI_CPP}
		${_ZS_APPLICATION_QRC_SRCS}
	)
	
	FOREACH(_ZS_CONF ${ZS_GLOBAL_CONFIGUATION_TYPES})
		STRING(TOUPPER ${_ZS_CONF} _ZS_CONF)
		SET_TARGET_PROPERTIES(${ZS_APPLICATION_NAME} PROPERTIES "OUTPUT_NAME_${_ZS_CONF}" "${ZS_APPLICATION_NAME}${CMAKE_${_ZS_CONF}_POSTFIX}")
	ENDFOREACH()
	
	SET_TARGET_PROPERTIES(${ZS_APPLICATION_NAME} PROPERTIES FOLDER "${ZS_APPLICATION_FOLDER}")
	SET_TARGET_PROPERTIES(${ZS_APPLICATION_NAME} PROPERTIES PUBLIC_HEADER "${ZS_APPLICATION_INCLUDE}")
	ZS_SETUP_TARGET_CONFIG_DEFINITIONS(${ZS_APPLICATION_NAME} "APPLICATION")
	ZS_SETUP_TARGET_CONFIG_COMPILE_OPTIONS(${ZS_APPLICATION_NAME} "APPLICATION")
	ZS_SETUP_TARGET_CONFIG_LINK_FLAGS(${ZS_APPLICATION_NAME} "APPLICATION")
	
	TARGET_INCLUDE_DIRECTORIES(${ZS_APPLICATION_NAME} PUBLIC
		${ZS_APPLICATION_INCLUDE_DIRECTORIES}
	)
	
	TARGET_LINK_LIBRARIES(${ZS_APPLICATION_NAME}
		${ZS_APPLICATION_LINK_LIBRARIES}
	)
	
	FOREACH(_ZS_DEPEND ${ZS_APPLICATION_DEPENDENCIES})
		ADD_DEPENDENCIES(${ZS_APPLICATION_NAME} ${_ZS_DEPEND})
	ENDFOREACH()
	
	IF(DEFINED ZS_APPLICATION_USE_QT_MODULES)
		QT5_USE_MODULES(${ZS_APPLICATION_NAME} 
			${ZS_APPLICATION_USE_QT_MODULES}
		)
	ENDIF()
	
	INSTALL(
		TARGETS ${ZS_APPLICATION_NAME}
		RUNTIME DESTINATION ${ZS_GLOBAL_INSATLL_BINDIR}
		LIBRARY DESTINATION ${ZS_GLOBAL_INSTALL_LIBDIR}
		ARCHIVE DESTINATION ${ZS_GLOBAL_INSTALL_ARCHIVEDIR}
		PUBLIC_HEADER DESTINATION ${ZS_GLOBAL_INSTALL_INCDIR}
	)
	
ENDMACRO(ZS_SETUP_APPLICATION)


MACRO(ZS_SETUP_LIBRARY)
	IF(ZS_LIBRARY_MOC_SRCS)
		FOREACH(moc_src ${ZS_LIBRARY_MOC_SRCS})
			QT5_WRAP_CPP(_ZS_LIBRARY_MOC_CPP ${moc_src} OPTIONS -f${moc_src} OPTIONS -DHAVE_QT5)
		ENDFOREACH()
	ENDIF()

	QT5_WRAP_UI(_ZS_LIBRARY_UI_CPP ${ZS_LIBRARY_UI_FORMS})

	IF(DEFINED ZS_LIBRARY_RESOURCES)
		QT5_ADD_RESOURCES(_ZS_LIBRARY_QRC_SRCS ${ZS_LIBRARY_RESOURCES})
	ENDIF()

	ADD_LIBRARY(${ZS_LIBRARY_NAME}
		${ZS_LIBRARY_LINKING}
		${ZS_LIBRARY_INCLUDE}
		${ZS_LIBRARY_INC}
		${ZS_LIBRARY_SRC}
		${_ZS_LIBRARY_MOC_CPP}
		${_ZS_LIBRARY_UI_CPP}
		${_ZS_LIBRARY_QRC_SRCS}
	)
	SOURCE_GROUP("include" FILES ${ZS_LIBRARY_INCLUDE})
	SOURCE_GROUP("inc" FILES ${ZS_LIBRARY_INC})
	SOURCE_GROUP("src" FILES ${ZS_LIBRARY_SRC})

	SOURCE_GROUP("Resources" 
		FILES
		${ZS_LIBRARY_RESOURCES}
		${ZS_LIBRARY_UI_FORMS}
    )

	SOURCE_GROUP("Generated" 
		FILES
		${_ZS_LIBRARY_MOC_CPP}
		${_ZS_LIBRARY_UI_CPP}
		${_ZS_LIBRARY_QRC_SRCS}
	)

	SET_TARGET_PROPERTIES(${ZS_LIBRARY_NAME} PROPERTIES FOLDER "${ZS_LIBRARY_FOLDER}")
	SET_TARGET_PROPERTIES(${ZS_LIBRARY_NAME} PROPERTIES PUBLIC_HEADER "${ZS_LIBRARY_INCLUDE}")
	ZS_SETUP_TARGET_CONFIG_DEFINITIONS(${ZS_LIBRARY_NAME} "LIBRARY")
	ZS_SETUP_TARGET_CONFIG_COMPILE_OPTIONS(${ZS_LIBRARY_NAME} "LIBRARY")
	ZS_SETUP_TARGET_CONFIG_LINK_FLAGS(${ZS_LIBRARY_NAME} "LIBRARY")
	
	TARGET_INCLUDE_DIRECTORIES(${ZS_LIBRARY_NAME} PUBLIC
		${ZS_LIBRARY_INCLUDE_DIRECTORIES}
	)
	
	TARGET_LINK_LIBRARIES(${ZS_LIBRARY_NAME}
		${ZS_LIBRARY_LINK_LIBRARIES}
	)
	
	FOREACH(_ZS_DEPEND ${ZS_LIBRARY_DEPENDENCIES})
		ADD_DEPENDENCIES(${ZS_LIBRARY_NAME} ${_ZS_DEPEND})
	ENDFOREACH()

	IF(DEFINED ZS_LIBRARY_USE_QT_MODULES)
		QT5_USE_MODULES(${ZS_LIBRARY_NAME} 
			${ZS_LIBRARY_USE_QT_MODULES}
		)
	ENDIF()
		
	INSTALL(
		TARGETS ${ZS_LIBRARY_NAME}
		RUNTIME DESTINATION ${ZS_GLOBAL_INSATLL_BINDIR}
		LIBRARY DESTINATION ${ZS_GLOBAL_INSTALL_LIBDIR}
		ARCHIVE DESTINATION ${ZS_GLOBAL_INSTALL_ARCHIVEDIR}
		PUBLIC_HEADER DESTINATION ${ZS_GLOBAL_INSTALL_INCDIR}
	)
	
ENDMACRO(ZS_SETUP_LIBRARY)

MACRO(ZS_SET_CONFIGUATION_TYPES)
	SET(CMAKE_CONFIGURATION_TYPES ${ZS_GLOBAL_CONFIGUATION_TYPES})
ENDMACRO(ZS_SET_CONFIGUATION_TYPES)

MACRO(ZS_SET_OUTPUT_DIRECTORY)
	SET(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${ZS_GLOBAL_OUTPUT_LIBDIR})
	SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${ZS_GLOBAL_OUTPUT_BINDIR})
	IF(ZS_WINDOWS)
		SET(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${ZS_GLOBAL_OUTPUT_BINDIR})
	ELSE(ZS_WINDOWS)
		SET(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${ZS_GLOBAL_OUTPUT_LIBDIR})
	ENDIF(ZS_WINDOWS)
	
	ZS_BUILDER_VERSION_GREATER(2 8 0)

	IF(ZS_VALID_BUILDER_VERSION)
		FOREACH(CONF ${ZS_GLOBAL_CONFIGUATION_TYPES})
			STRING(TOUPPER "${CONF}" CONF)
			SET("CMAKE_ARCHIVE_OUTPUT_DIRECTORY_${CONF}" ${ZS_GLOBAL_OUTPUT_LIBDIR})
			SET("CMAKE_RUNTIME_OUTPUT_DIRECTORY_${CONF}" ${ZS_GLOBAL_OUTPUT_BINDIR})
			IF(ZS_WINDOWS)
				SET("CMAKE_LIBRARY_OUTPUT_DIRECTORY_${CONF}" ${ZS_GLOBAL_OUTPUT_BINDIR})
			ELSE()
				SET("CMAKE_LIBRARY_OUTPUT_DIRECTORY_${CONF}" ${ZS_GLOBAL_OUTPUT_LIBDIR})
			ENDIF()	
		ENDFOREACH()
	ENDIF(ZS_VALID_BUILDER_VERSION)
	
ENDMACRO(ZS_SET_OUTPUT_DIRECTORY)

MACRO(ZS_SET_POSTFIX)
	FOREACH(CONF ${ZS_GLOBAL_CONFIGUATION_TYPES})
		STRING(TOUPPER "${CONF}" CONF)
		SET("CMAKE_${CONF}_POSTFIX" "${ZS_GLOBAL_POSTFIX_${CONF}}")
	ENDFOREACH()
ENDMACRO(ZS_SET_POSTFIX)

MACRO(ZS_SET_LIBRARY_LINKING)
	IF(ZS_GLOBAL_DYNAMIC)
		SET(ZS_LIBRARY_LINKING "SHARED")
	ELSE()
		SET(ZS_LIBRARY_LINKING "STATIC")
	ENDIF()
ENDMACRO(ZS_SET_LIBRARY_LINKING)

MACRO(ZS_SET_FOLDERS_ENABLE)
	SET_PROPERTY(GLOBAL PROPERTY USE_FOLDERS ON)
ENDMACRO(ZS_SET_FOLDERS_ENABLE)

MACRO(ZS_CHECK_LIBRARY_LINKING)
	IF(ZS_LIBRARY_LINKING MATCHES "SHARED")
		SET(ZS_RESULT_LIBRARY_LINK_DYNAMIC ON)
	ELSEIF(ZS_LIBRARY_LINKING MATCHES "STATIC")
		SET(ZS_RESULT_LIBRARY_LINK_DYNAMIC OFF)
	ELSE()
		MESSAGE(FATAL_ERROR "ZS_LIBRARY_LINKING INVALID, ZS_LIBRARY_LINKING=${ZS_LIBRARY_LINKING}")
	ENDIF()
ENDMACRO(ZS_CHECK_LIBRARY_LINKING)

MACRO(ZS_FIND_MODULE __MODULE_NAME)
	#MESSAGE("Finding ${__MODULE_NAME} begin ......")
	STRING(TOUPPER "${__MODULE_NAME}" __MODULE_NAME_UPPER)

	SET("ZS_${__MODULE_NAME_UPPER}_FOUND" "YES")
	#MESSAGE("ZS_${__MODULE_NAME_UPPER}_FOUND=${ZS_${__MODULE_NAME_UPPER}_FOUND}")

	FOREACH(CONF ${ZS_GLOBAL_CONFIGUATION_TYPES})
		STRING(TOUPPER "${CONF}" CONF)
		SET("ZS_${__MODULE_NAME_UPPER}_LIBRARIES_${CONF}"
			"${ZS_GLOBAL_OUTPUT_LIBDIR}/${__MODULE_NAME}${ZS_GLOBAL_POSTFIX_${CONF}}.lib"
		)
		
		FIND_LIBRARY("_ZS_LIBNAME_${CONF}"
			NAMES "${__MODULE_NAME}${ZS_GLOBAL_POSTFIX_${CONF}}"
			PATHS
			${ZS_GLOBAL_OUTPUT_LIBDIR}
			NO_DEFAULT_PATH
		)
		
		MESSAGE("_ZS_LIBNAME_${CONF}=${_ZS_LIBNAME_${CONF}}")
		
		#MESSAGE("ZS_${__MODULE_NAME_UPPER}_LIBRARIES_${CONF}=${ZS_${__MODULE_NAME_UPPER}_LIBRARIES_${CONF}}")
	ENDFOREACH()
	
	ZS_VAR_CONFIG_GENERATOR_EXPRESSION("ZS_${__MODULE_NAME_UPPER}_LIBRARIES" "ZS_${__MODULE_NAME_UPPER}_LIBRARIES_CONFIG_GENERATOR")
	#MESSAGE("ZS_${__MODULE_NAME_UPPER}_LIBRARIES_CONFIG_GENERATOR=${ZS_${__MODULE_NAME_UPPER}_LIBRARIES_CONFIG_GENERATOR}")

	#MESSAGE("Finding ${__MODULE_NAME} end ......")
ENDMACRO(ZS_FIND_MODULE __MODULE_NAME)

MACRO(ZS_ADD_CONFIG _ZS_CONFIG_NAME _ZS_CONFIG_POSTFIX)
	IF(NOT ZS_GLOBAL_CONFIGUATION_TYPES)
		SET(ZS_GLOBAL_CONFIGUATION_TYPES "${_ZS_CONFIG_NAME}")
	ELSE()
		SET(ZS_GLOBAL_CONFIGUATION_TYPES "${ZS_GLOBAL_CONFIGUATION_TYPES};${_ZS_CONFIG_NAME}")
	ENDIF()
	STRING(TOUPPER "${_ZS_CONFIG_NAME}" _ZS_CONFIG_NAME_UPPER)
	SET("ZS_GLOBAL_POSTFIX_${_ZS_CONFIG_NAME_UPPER}" ${_ZS_CONFIG_POSTFIX})
	
	IF(NOT DEFINED CMAKE_EXE_LINKER_FLAGS_${_ZS_CONFIG_NAME_UPPER})
		SET(CMAKE_EXE_LINKER_FLAGS_${_ZS_CONFIG_NAME_UPPER} "")
	ENDIF()
	
	IF(NOT DEFINED CMAKE_SHARED_LINKER_FLAGS_${_ZS_CONFIG_NAME_UPPER})
		SET(CMAKE_SHARED_LINKER_FLAGS_${_ZS_CONFIG_NAME_UPPER} "")
	ENDIF()
	
ENDMACRO(ZS_ADD_CONFIG _ZS_CONFIG_NAME)

