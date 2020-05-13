#######################################################################################
#
#	Copy Right : ZSoft R&D
#
#######################################################################################

SET(ZS_GRAPHICS_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
MESSAGE("ZS_GRAPHICS_SOURCE_DIR=${ZS_GRAPHICS_SOURCE_DIR}")
SET(ZS_GRAPHICS_INCLUDE_DIR ${ZS_GRAPHICS_SOURCE_DIR}/include)
MESSAGE("ZS_GRAPHICS_INCLUDE_DIR=${ZS_GRAPHICS_INCLUDE_DIR}")

ADD_SUBDIRECTORY(graphics_shared_module1)
ADD_SUBDIRECTORY(graphics_static_module2)