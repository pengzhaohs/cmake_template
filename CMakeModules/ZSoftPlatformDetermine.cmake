#######################################################################################
#
#	Copy Right : ZSoft R&D
#
#######################################################################################


#######################################################################################
#
#	ZS_WINDOWS_32
#	ZS_WINDOWS_64
#	
#	ZS_MAC
#
#######################################################################################

SET(ZS_WINDOWS 0)
SET(ZS_WINDOWS_BUILD_32 0)
SET(ZS_WINDOWS_BUILD_64 0)

SET(ZS_MAC 0)
SET(ZS_MAC_BUILD_XX 0)

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

IF(ZS_WINDOWS_BUILD_32)
	MESSAGE("zsoft build windows 32")
ELSEIF(ZS_WINDOWS_BUILD_64)
	MESSAGE("zsoft build windows 64")
ELSEIF(ZS_MAC)
	MESSAGE("zsoft build mac")
ELSE()
	MESSAGE(FATAL_ERROR "zsoft build unknow")
ENDIF()