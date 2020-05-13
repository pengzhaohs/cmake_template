#######################################################################################
#
#	Copy Right : ZSoft R&D
#
#######################################################################################

SET(ZS_GUI_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
MESSAGE("ZS_GUI_SOURCE_DIR=${ZS_GUI_SOURCE_DIR}")
SET(ZS_GUI_INCLUDE_DIR ${ZS_GUI_SOURCE_DIR}/include)
MESSAGE("ZS_GUI_INCLUDE_DIR=${ZS_GUI_INCLUDE_DIR}")

ADD_SUBDIRECTORY(gui_shared_module1)
ADD_SUBDIRECTORY(gui_default_module2)