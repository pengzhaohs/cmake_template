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
#
#	ZS_LIBRARY_MOC_SRCS : [option]
#	ZS_LIBRARY_UI_FORMS : [option]
#	ZS_LIBRARY_RESOURCES : [option]
#
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
#	ZS_LIBRARY_USE_QT_MODULES : [option]
#
#######################################################################################

SET(ZS_LIBRARY_LINKING "STATIC")
ZS_CHECK_LIBRARY_LINKING()
IF(ZS_RESULT_LIBRARY_LINK_DYNAMIC)
	ADD_DEFINITIONS(-DDLL_GRAPHICS_MODULE2_EXPORTS)
ELSE()
	ADD_DEFINITIONS(-DSTATIC_GRAPHICS_MODULE2_EXPORTS)
ENDIF()

SET(ZS_LIBRARY_NAME graphics_module2)

FIND_PACKAGE(base_module1)
FIND_PACKAGE(base_module2)

SET(ZS_LIBRARY_INCLUDE
	${ZS_GRAPHICS_INCLUDE_DIR}/graphics_module2_dummy1.h
	${ZS_GRAPHICS_INCLUDE_DIR}/graphics_module2_dummy2.h
	${ZS_GRAPHICS_INCLUDE_DIR}/graphics_module2_export.h
)

SET(ZS_LIBRARY_INC
	inc/graphics_module2_dummy_p.h
)

SET(ZS_LIBRARY_SRC
	src/graphics_module2_dummy1.cpp
	src/graphics_module2_dummy2.cpp
	src/graphics_module2_dummy_p.cpp
)

SET(ZS_LIBRARY_FOLDER "graphics")

SET(ZS_LIBRARY_GENERAL_DEFINITIONS "COMMON_D1;COMMON_D2;COMMON_D3")
SET(ZS_LIBRARY_DEFINITIONS_DEBUG "DEBUG_D1;DEBUG_D2")
SET(ZS_LIBRARY_DEFINITIONS_RELEASE "RELEASE_D1;RELEASE_D2;RELEASE_D3")
SET(ZS_LIBRARY_DEFINITIONS_MINSIZEREL "MINSIZEREL_D1;MINSIZEREL_D2;MINSIZEREL_D3;MINSIZEREL_D4")
SET(ZS_LIBRARY_DEFINITIONS_RELWITHDEBINFO "RELWITHDEBINFO_D1;RELWITHDEBINFO_D2;RELWITHDEBINFO_D3;RELWITHDEBINFO_D4;RELWITHDEBINFO_D5")

SET(ZS_LIBRARY_GENERAL_COMPILE_OPTIONS
)

SET(ZS_LIBRARY_COMPILE_OPTIONS_ALPHA 
)

SET(ZS_LIBRARY_GENERAL_LINK_FLAGS
)

SET(ZS_LIBRARY_LINK_FLAGS_ALPHA
)

SET(ZS_LIBRARY_INCLUDE_DIRECTORIES
	${ZS_GRAPHICS_INCLUDE_DIR}
	inc
	${ZS_BASE_MODULE1_INCLUDE_DIR}
	${ZS_BASE_MODULE2_INCLUDE_DIR}
)

SET(ZS_LIBRARY_LINK_LIBRARIES
	base_module1
	base_module2
)

ZS_SETUP_LIBRARY()


