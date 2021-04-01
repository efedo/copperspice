add_library(sharedtools OBJECT "")

list(APPEND SHAREDTOOLS_INCLUDES
   ${CMAKE_BINARY_DIR}/include
   ${CMAKE_BINARY_DIR}/privateinclude

   ${CMAKE_BINARY_DIR}/include/QtCore
   ${CMAKE_BINARY_DIR}/privateinclude/QtCore/private

   ${CMAKE_BINARY_DIR}/include/QtXml
   ${CMAKE_BINARY_DIR}/privateinclude/QtXml/private

   ${CS_SOURCE_DIR}/src/tools/shared
)

list(APPEND SHAREDTOOLS_HEADERS
    ${CS_SOURCE_DIR}/src/tools/shared/numerus.h
    ${CS_SOURCE_DIR}/src/tools/shared/translator.h
    ${CS_SOURCE_DIR}/src/tools/shared/translatormessage.h
    ${CS_SOURCE_DIR}/src/tools/shared/qm.h
    ${CS_SOURCE_DIR}/src/tools/shared/qph.h
    ${CS_SOURCE_DIR}/src/tools/shared/po.h
    ${CS_SOURCE_DIR}/src/tools/shared/ts.h
    ${CS_SOURCE_DIR}/src/tools/shared/xliff.h
)

target_sources(sharedtools
   PRIVATE
   ${CS_SOURCE_DIR}/src/tools/shared/numerus.cpp
   ${CS_SOURCE_DIR}/src/tools/shared/translator.cpp
   ${CS_SOURCE_DIR}/src/tools/shared/translatormessage.cpp
   ${CS_SOURCE_DIR}/src/tools/shared/qm.cpp
   ${CS_SOURCE_DIR}/src/tools/shared/qph.cpp
   ${CS_SOURCE_DIR}/src/tools/shared/po.cpp
   ${CS_SOURCE_DIR}/src/tools/shared/ts.cpp
   ${CS_SOURCE_DIR}/src/tools/shared/xliff.cpp
)

function_variable_fixup("${SHAREDTOOLS_EXTRA_CXXFLAGS}" SHAREDTOOLS_EXTRA_CXXFLAGS)
function_variable_fixup("${SHAREDTOOLS_EXTRA_LDFLAGS}"  SHAREDTOOLS_EXTRA_LDFLAGS)

target_compile_definitions(sharedtools PRIVATE ${SHAREDTOOLS_DEFINITIONS})
target_include_directories(sharedtools PRIVATE ${SHAREDTOOLS_INCLUDES})

set_target_properties(sharedtools
   PROPERTIES
   COMPILE_FLAGS ${SHAREDTOOLS_EXTRA_CXXFLAGS}
   LINK_FLAGS ${SHAREDTOOLS_EXTRA_LDFLAGS}
)
