SET(ZS_GLOBAL_CONFIGUATION_TYPES "")

ZS_ADD_CONFIG("Debug" "d")
ZS_ADD_CONFIG("Release" "")
ZS_ADD_CONFIG("MinSizeRel" "s")
ZS_ADD_CONFIG("RelWithDebInfo" "rd")
ZS_ADD_CONFIG("Alpha" "a")

SET(ZS_GLOBAL_OUTPUT_BINDIR ${PROJECT_BINARY_DIR}/bin)
SET(ZS_GLOBAL_OUTPUT_LIBDIR ${PROJECT_BINARY_DIR}/lib)

OPTION(ZS_GLOBAL_DYNAMIC "Set to On to build all library for dynamic linking. Use OFF for static linking" ON)
