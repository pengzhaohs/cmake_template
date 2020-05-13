#######################################################################################
#
#	Copy Right : ZSoft R&D
#
#######################################################################################


#######################################################################################
#
#	ZS_WINDOWS
#	ZS_WINDOWS_BUILD_32
#	ZS_WINDOWS_BUILD_64
#	
#	ZS_MAC
#	ZS_MAC_BUILD_XX
#
#	ZS_UNIX
#	ZS_UNIX_BUILD_XX
#
#######################################################################################

SET(ZS_WINDOWS 0)
SET(ZS_WINDOWS_BUILD_32 0)
SET(ZS_WINDOWS_BUILD_64 0)

SET(ZS_MAC 0)
SET(ZS_MAC_BUILD_XX 0)

SET(ZS_UNIX 0)
SET(ZS_UNIX_BUILD_XX 0)

IF(WIN32)
	SET(ZS_WINDOWS 1)
	
	IF(CMAKE_CL_64)
		SET(ZS_WINDOWS_BUILD_64 1)
	ELSE()
		SET(ZS_WINDOWS_BUILD_32 1)
	ENDIF(CMAKE_CL_64)
	
ENDIF(WIN32)

IF(APPLE)
	SET(ZS_MAC 1)
	SET(ZS_MAC_BUILD_XX 1)
ENDIF(APPLE)

IF(UNIX)
	SET(ZS_UNIX 1)
	SET(ZS_UNIX_BUILD 1)
ENDIF(UNIX)

IF(ZS_WINDOWS_BUILD_32)
	MESSAGE("zsoft build windows 32")
ELSEIF(ZS_WINDOWS_BUILD_64)
	MESSAGE("zsoft build windows 64")
ELSEIF(ZS_MAC_BUILD_XX)
	MESSAGE("zsoft build mac xx")
ELSEIF(ZS_UNIX_BUILD)
	MESSAGE("zsoft build unix xx")
ELSE()
	MESSAGE(FATAL_ERROR "zsoft build unknow")
ENDIF()
