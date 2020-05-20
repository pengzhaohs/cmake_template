#######################################################################################
#
#	Copy Right : ZSoft R&D
#
#######################################################################################

SET(ZS_APPLICATIONS_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
MESSAGE("ZS_APPLICATIONS_SOURCE_DIR=${ZS_APPLICATIONS_SOURCE_DIR}")
SET(ZS_APPLICATIONS_INCLUDE_DIR ${ZS_APPLICATIONS_SOURCE_DIR}/include)
MESSAGE("ZS_APPLICATIONS_INCLUDE_DIR=${ZS_APPLICATIONS_INCLUDE_DIR}")

ADD_SUBDIRECTORY(application_bim)
ADD_SUBDIRECTORY(application_other)
ADD_SUBDIRECTORY(application_bim_qt)