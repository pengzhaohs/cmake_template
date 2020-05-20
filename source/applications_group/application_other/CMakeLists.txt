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
#	ZS_APPLICATION_NAME : [required] library name
#
#	ZS_APPLICATION_INCLUDE : [option] visiable header files
#   ZS_APPLICATION_INC : [option] invisiable header files
#	ZS_APPLICATION_SRC : [option] source files
#
#	ZS_APPLICATION_MOC_SRCS : [option]
#	ZS_APPLICATION_UI_FORMS : [option]
#	ZS_APPLICATION_RESOURCES : [option]
#
#	ZS_APPLICATION_FOLDER : [option] value should be "" or "folder1" or "folder1/folder2"
#
#	ZS_APPLICATION_GENERAL_DEFINITIONS : [option]
#	ZS_APPLICATION_DEFINITIONS_<CONFIG> : [option]
#
#	ZS_APPLICATION_GENERAL_COMPILE_OPTIONS : [option]
#	ZS_APPLICATION_COMPILE_OPTIONS_<CONFIG> : [option]
#
#	ZS_APPLICATION_GENERAL_LINK_FLAGS : [option]
#	ZS_APPLICATION_LINK_FLAGLS_<CONFIG> : [option]
#
#	ZS_APPLICATION_INCLUDE_DIRECTORIES : [option]
#	ZS_APPLICATION_LINK_LIBRARIES : [option]
#
#	ZS_APPLICATION_USE_QT_MODULES : [option]
#
#######################################################################################

SET(ZS_APPLICATION_NAME application_other)

SET(ZS_APPLICATION_INCLUDE 
	${ZS_APPLICATIONS_INCLUDE_DIR}/app_other_dummy1.h
	${ZS_APPLICATIONS_INCLUDE_DIR}/app_other_dummy2.h
)

SET(ZS_APPLICATION_INC 
	inc/app_other_dummy_p.h
)

SET(ZS_APPLICATION_SRC
	src/app_other_dummy1.cpp
	src/app_other_dummy2.cpp
	src/main.cpp
)

SET(ZS_APPLICATION_MOC_SRCS
)

SET(ZS_APPLICATION_UI_FORMS
)

SET(ZS_APPLICATION_RESOURCES
)

SET(ZS_APPLICATION_FOLDER "applications")

SET(ZS_APPLICATION_GENERAL_DEFINITIONS "COMMON_D1;COMMON_D2;COMMON_D3")
SET(ZS_APPLICATION_DEFINITIONS_DEBUG "DEBUG_D1;DEBUG_D2")
SET(ZS_APPLICATION_DEFINITIONS_RELEASE "RELEASE_D1;RELEASE_D2;RELEASE_D3")
SET(ZS_APPLICATION_DEFINITIONS_MINSIZEREL "MINSIZEREL_D1;MINSIZEREL_D2;MINSIZEREL_D3;MINSIZEREL_D4")
SET(ZS_APPLICATION_DEFINITIONS_RELWITHDEBINFO "RELWITHDEBINFO_D1;RELWITHDEBINFO_D2;RELWITHDEBINFO_D3;RELWITHDEBINFO_D4;RELWITHDEBINFO_D5")

SET(ZS_APPLICATION_GENERAL_COMPILE_OPTIONS
)

SET(ZS_APPLICATION_COMPILE_OPTIONS_ALPHA 
)

SET(ZS_APPLICATION_GENERAL_LINK_FLAGS
)

SET(ZS_APPLICATION_LINK_FLAGS_ALPHA
)


SET(ZS_APPLICATION_INCLUDE_DIRECTORIES
	${ZS_APPLICATIONS_INCLUDE_DIR}
	inc
)

SET(ZS_APPLICATION_USE_QT_MODULES
)

ZS_SETUP_APPLICATION()