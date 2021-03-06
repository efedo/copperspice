list(APPEND PRINTERDRIVERS_CUPS_PRIVATE_INCLUDES
	${CS_SOURCE_DIR}/src/plugins/printerdrivers/cups/qppdprintdevice.h
	${CS_SOURCE_DIR}/src/plugins/printerdrivers/cups/qcupsprintersupport_p.h
	${CS_SOURCE_DIR}/src/plugins/printerdrivers/cups/qcupsprintengine_p.h
)

if(Cups_FOUND)
   add_library(CsPrinterDriverCups MODULE "")
   add_library(CopperSpice::CsPrinterDriverCups ALIAS CsPrinterDriverCups)

   set_target_properties(CsPrinterDriverCups PROPERTIES OUTPUT_NAME CsPrinterDriverCups${BUILD_ABI} PREFIX "")

   target_sources(CsPrinterDriverCups
      PRIVATE
   	${CS_SOURCE_DIR}/src/plugins/printerdrivers/cups/main.cpp
   	${CS_SOURCE_DIR}/src/plugins/printerdrivers/cups/qppdprintdevice.cpp
   	${CS_SOURCE_DIR}/src/plugins/printerdrivers/cups/qcupsprintengine.cpp
   	${CS_SOURCE_DIR}/src/plugins/printerdrivers/cups/qcupsprintersupport.cpp
   )

   target_include_directories(CsPrinterDriverCups
      PRIVATE
      ${CUPS_INCLUDE_DIRS}
   )

   target_link_libraries(CsPrinterDriverCups
      CsCore
      CsGui
      ${CUPS_LIBRARIES}
   )

   target_compile_definitions(CsPrinterDriverCups
      PRIVATE
      -DCS_BUILDING_CUPS
      -DQT_PLUGIN
   )

   function_generate_resources(CsPrinterDriverCups)

   install(TARGETS CsPrinterDriverCups DESTINATION ${CMAKE_INSTALL_LIBDIR})
endif()

