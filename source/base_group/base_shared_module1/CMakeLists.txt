#######################################################################################
#
#	Copy Right : ZSoft R&D
#
#######################################################################################

#######################################################################################
#	[option] : you can ignore the definition
#	[required]	 : you should always explict give a definition
#
#	SET list:	
#	ZS_LIBRARY_LINKING : [option] if you expict set the var, the value should be "SHARED" or "STATIC"
#	ZS_LIBRARY_NAME : [required] library name
#
#	ZS_LIBRARY_INCLUDE : [option] visiable header files
#   ZS_LIBRARY_INC : [option] invisiable header files
#	ZS_LIBRARY_SRC : [option] source files
#	ZS_LIBRARY_FOLDER : [option] value should be "" or "folder1" or "folder1/folder2"
#
#	ZS_LIBRARY_GENERAL_DEFINITIONS : [option]
#	ZS_LIBRARY_DEFINITIONS_<CONFIG> : [option]
#
#	ZS_LIBRARY_GENERAL_COMPILE_OPTIONS : [option]
#	ZS_LIBRARY_COMPILE_OPTIONS_<CONFIG> : [option]
#
#	ZS_LIBRARY_GENERAL_LINK_FLAGS : [option]
#	ZS_LIBRARY_LINK_FLAGLS_<CONFIG> : [option]
#
#	ZS_LIBRARY_INCLUDE_DIRECTORIES : [option]
#	ZS_LIBRARY_LINK_LIBRARIES : [option]
#
#######################################################################################

SET(ZS_LIBRARY_LINKING "SHARED")
ZS_CHECK_LIBRARY_LINKING()
IF(ZS_RESULT_LIBRARY_LINK_DYNAMIC)
	ADD_DEFINITIONS(-DDLL_BASE_MODULE1_EXPORTS)
ELSE()
	ADD_DEFINITIONS(-DSTATIC_BASE_MODULE1_EXPORTS)
ENDIF()

SET(ZS_LIBRARY_NAME base_module1)

SET(ZS_LIBRARY_INCLUDE
	${ZS_BASE_INCLUDE_DIR}/base_module1_dummy1.h
	${ZS_BASE_INCLUDE_DIR}/base_module1_dummy2.h
	${ZS_BASE_INCLUDE_DIR}/base_module1_export.h
)

SET(ZS_LIBRARY_INC
	inc/base_module1_dummy_p.h
)

SET(ZS_LIBRARY_SRC
	src/base_module1_dummy1.cpp
	src/base_module1_dummy2.cpp
	src/base_module1_dummy_p.cpp
)

SET(ZS_LIBRARY_FOLDER "base")

SET(ZS_LIBRARY_GENERAL_DEFINITIONS "COMMON_D1;COMMON_D2;COMMON_D3")
SET(ZS_LIBRARY_DEFINITIONS_DEBUG "DEBUG_D1;DEBUG_D2")
SET(ZS_LIBRARY_DEFINITIONS_RELEASE "RELEASE_D1;RELEASE_D2;RELEASE_D3")
SET(ZS_LIBRARY_DEFINITIONS_MINSIZEREL "MINSIZEREL_D1;MINSIZEREL_D2;MINSIZEREL_D3;MINSIZEREL_D4")
SET(ZS_LIBRARY_DEFINITIONS_RELWITHDEBINFO "RELWITHDEBINFO_D1;RELWITHDEBINFO_D2;RELWITHDEBINFO_D3;RELWITHDEBINFO_D4;RELWITHDEBINFO_D5")

IF(ZS_WINDOWS)
	SET(__ZS_PLATFORM_COMPILE_OPTIONS
		/std:c++14
	)
	
	SET(__ZS_PLATFORM_COMPILE_OPTIONS_ALPHA
		/openmp
	)
	
	SET(__ZS_PLATFORM_LINK_FLAGS
		/PROFILE
	)
	
	SET(__ZS_PLATFORM_LINK_FLAGS_ALPHA
		/INCREMENTAL:NO
	)
	
ELSEIF(ZS_MAC)
	SET(__ZS_PLATFORM_COMPILE_OPTIONS
	)
	
	SET(__ZS_PLATFORM_COMPILE_OPTIONS_ALPHA
	)
	
	SET(__ZS_PLATFORM_LINK_FLAGS
	)
	
	SET(__ZS_PLATFORM_LINK_FLAGS_ALPHA
	)
	
ELSE()
	MESSAGE(FATAL_ERROR "zsoft not support platform")
ENDIF()

SET(ZS_LIBRARY_GENERAL_COMPILE_OPTIONS
	${__ZS_PLATFORM_COMPILE_OPTIONS}
)

SET(ZS_LIBRARY_COMPILE_OPTIONS_ALPHA 
	${__ZS_PLATFORM_COMPILE_OPTIONS_ALPHA}
)


SET(ZS_LIBRARY_GENERAL_LINK_FLAGS
	${__ZS_PLATFORM_LINK_FLAGS}
)

SET(ZS_LIBRARY_LINK_FLAGS_ALPHA
	${__ZS_PLATFORM_LINK_FLAGS_ALPHA}
)

SET(ZS_LIBRARY_INCLUDE_DIRECTORIES
	${ZS_BASE_INCLUDE_DIR}
	inc
)

SET(ZS_LIBRARY_LINK_LIBRARIES
)

ZS_SETUP_LIBRARY()


