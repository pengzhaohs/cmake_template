#######################################################################################
#
#	Copy Right : ZSoft R&D
#
#######################################################################################

SET(ZS_BASE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
MESSAGE("ZS_BASE_SOURCE_DIR=${ZS_BASE_SOURCE_DIR}")
SET(ZS_BASE_INCLUDE_DIR ${ZS_BASE_SOURCE_DIR}/include)
MESSAGE("ZS_BASE_INCLUDE_DIR=${ZS_BASE_INCLUDE_DIR}")

ADD_SUBDIRECTORY(base_shared_module1)
ADD_SUBDIRECTORY(base_shared_module2)