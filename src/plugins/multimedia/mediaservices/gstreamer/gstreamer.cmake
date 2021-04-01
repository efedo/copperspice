list(APPEND MULTIMEDIA_PRIVATE_INCLUDES
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/audiodecoder/qgstreameraudiodecodercontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/audiodecoder/qgstreameraudiodecoderservice.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/audiodecoder/qgstreameraudiodecodersession.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin.h

   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_audioencoder.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_capturedestination.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_capturebufferformat.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_container.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_control.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_imagecapture.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_imageencoder.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_imageprocessing.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_infocontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_metadata.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_recorder.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_resourcepolicy.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_serviceplugin.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_service.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_session.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_videoencoder.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_viewfindersettings.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_viewfindersettings2.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_zoom.h

   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/mediaplayer/qgstreameravailabilitycontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/mediaplayer/qgstreamermetadataprovider.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/mediaplayer/qgstreamerplayerservice.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/mediaplayer/qgstreamerstreamscontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/mediaplayer/qgstreamerplayercontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/mediaplayer/qgstreamerplayersession.h

   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstutils_p.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreameraudioinputselector_p.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreameraudioprobecontrol_p.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreamerbufferprobe_p.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreamerbushelper_p.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreamermessage_p.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreamervideowidget_p.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreamervideoinputdevicecontrol_p.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreamervideoprobecontrol_p.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreamervideorendererinterface_p.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreamervideooverlay_p.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreamervideowindow_p.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreamervideorenderer_p.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstbufferpoolinterface_p.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstvideorendererplugin_p.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstvideorenderersink_p.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstvideobuffer_p.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qvideosurfacegstsink_p.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/gstvideoconnector_p.h
)

if(WITH_MULTIMEDIA AND GStreamer_FOUND)

   set(GSTREAMER_TOOLS_SOURCES
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstutils.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreameraudioprobecontrol.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreamerbufferprobe.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreamerbushelper.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreamermessage.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreamervideowidget.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreamervideoinputdevicecontrol.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreamervideoprobecontrol.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreamervideorendererinterface.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreamervideooverlay.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreamervideowindow.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreamervideorenderer.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstvideobuffer.cpp
   )

   # plugin 1
   add_library(CsMultimedia_gst_audiodecoder MODULE "")
   add_library(CopperSpice::CsMultimedia_gst_audiodecoder ALIAS CsMultimedia_gst_audiodecoder)

   set_target_properties(CsMultimedia_gst_audiodecoder PROPERTIES OUTPUT_NAME CsMultimedia_gst_audiodecoder${BUILD_ABI} PREFIX "")

   target_sources(CsMultimedia_gst_audiodecoder
      PRIVATE
      ${GSTREAMER_TOOLS_SOURCES}
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/audiodecoder/qgstreameraudiodecodercontrol.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/audiodecoder/qgstreameraudiodecoderservice.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/audiodecoder/qgstreameraudiodecodersession.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin.cpp
   )

   if (GSTREAMER_ABI_VERSION VERSION_EQUAL "0.10")

      target_sources(CsMultimedia_gst_audiodecoder
         PRIVATE
         ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qvideosurfacegstsink.cpp
      )

   else()
      target_sources(CsMultimedia_gst_audiodecoder
         PRIVATE
         ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstvideorendererplugin.cpp
         ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstvideorenderersink.cpp
      )

   endif()

   target_link_libraries(CsMultimedia_gst_audiodecoder
      CsCore
      CsGui
      CsNetwork
      CsMultimedia
      ${GSTREAMER_LIBRARIES}
      ${GSTREAMER_BASE_LIBRARIES}
      ${GSTREAMER_AUDIO_LIBRARIES}
      ${GSTREAMER_VIDEO_LIBRARIES}
      ${GSTREAMER_APP_LIBRARIES}
      ${GLIB2_LIBRARIES}
      ${GOBJECT2_LIBRARIES}
   )

   if (GSTREAMER_ABI_VERSION VERSION_EQUAL "0.10")
      target_link_libraries(CsMultimedia_gst_audiodecoder
         ${GSTREAMER_INTERFACES_LIBRARIES}
      )
   endif()

   target_include_directories(
      CsMultimedia_gst_audiodecoder
      PRIVATE
      ${GSTREAMER_INCLUDE_DIR}
      ${GLIB2_INCLUDES}
   )

   target_compile_definitions(CsMultimedia_gst_audiodecoder
      PRIVATE
      -DQT_PLUGIN
   )

   # plugin 2
   add_library(CsMultimedia_gst_camerabin MODULE "")
   add_library(CopperSpice::CsMultimedia_gst_camerabin ALIAS CsMultimedia_gst_camerabin)

   set_target_properties(CsMultimedia_gst_camerabin PROPERTIES OUTPUT_NAME CsMultimedia_gst_camerabin${BUILD_ABI} PREFIX "")

   target_sources(CsMultimedia_gst_camerabin
      PRIVATE
      ${GSTREAMER_TOOLS_SOURCES}
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_serviceplugin.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_service.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_session.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_control.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_audioencoder.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_container.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_imagecapture.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_imageencoder.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_zoom.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_imageprocessing.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_metadata.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_recorder.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_videoencoder.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_resourcepolicy.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_capturedestination.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_viewfindersettings.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_viewfindersettings2.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_capturebufferformat.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/camera/camera_infocontrol.cpp

      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstreameraudioinputselector.cpp
   )

   if (GSTREAMER_ABI_VERSION VERSION_EQUAL "0.10")

      target_sources(CsMultimedia_gst_camerabin
         PRIVATE
         ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qvideosurfacegstsink.cpp
      )

   else()
      target_sources(CsMultimedia_gst_camerabin
         PRIVATE
         ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstvideorenderersink.cpp
      )

   endif()

   target_link_libraries(CsMultimedia_gst_camerabin
      CsCore
      CsGui
      CsNetwork
      CsMultimedia
      ${GSTREAMER_LIBRARIES}
      ${GSTREAMER_AUDIO_LIBRARIES}
      ${GSTREAMER_VIDEO_LIBRARIES}
      ${GLIB2_LIBRARIES}
      ${GOBJECT2_LIBRARIES}
   )

   if (GSTREAMER_ABI_VERSION VERSION_EQUAL "0.10")
      target_link_libraries(CsMultimedia_gst_camerabin
      ${GSTREAMER_LIBRARIES}
      ${GSTREAMER_BASE_LIBRARIES}
      ${GSTREAMER_INTERFACES_LIBRARIES}
   )
   endif()

   target_include_directories(
      CsMultimedia_gst_camerabin
      PRIVATE
      ${GSTREAMER_INCLUDE_DIR}
   )

   target_compile_definitions(CsMultimedia_gst_camerabin
      PRIVATE
      -DQT_PLUGIN
   )

   # plugin 3
   add_library(CsMultimedia_gst_mediaplayer MODULE "")
   add_library(CopperSpice::CsMultimedia_gst_mediaplayer ALIAS CsMultimedia_gst_mediaplayer)

   set_target_properties(CsMultimedia_gst_mediaplayer PROPERTIES OUTPUT_NAME CsMultimedia_gst_mediaplayer${BUILD_ABI} PREFIX "")

   target_sources(CsMultimedia_gst_mediaplayer
      PRIVATE
      ${GSTREAMER_TOOLS_SOURCES}
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/mediaplayer/qgstreamerplayerservice.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/mediaplayer/qgstreamerstreamscontrol.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/mediaplayer/qgstreamermetadataprovider.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/mediaplayer/qgstreameravailabilitycontrol.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/mediaplayer/qgstreamerplayersession.cpp
   )

   if (GSTREAMER_ABI_VERSION VERSION_EQUAL "0.10")

      target_sources(CsMultimedia_gst_mediaplayer
         PRIVATE
         ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qvideosurfacegstsink.cpp
         ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstbufferpoolinterface.cpp
         ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/gstvideoconnector.cpp
      )

   else()
      target_sources(CsMultimedia_gst_mediaplayer
         PRIVATE
         ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstvideorendererplugin.cpp
         ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/gstreamer/tools/qgstvideorenderersink.cpp
      )
   endif()

   target_link_libraries(CsMultimedia_gst_mediaplayer
      CsCore
      CsGui
      CsNetwork
      CsMultimedia
      ${GSTREAMER_LIBRARIES}
      ${GSTREAMER_BASE_LIBRARIES}
      ${GSTREAMER_AUDIO_LIBRARIES}
      ${GSTREAMER_VIDEO_LIBRARIES}
      ${GSTREAMER_APP_LIBRARIES}
      ${GLIB2_LIBRARIES}
      ${GOBJECT2_LIBRARIES}
   )

   if (GSTREAMER_ABI_VERSION VERSION_EQUAL "0.10")
      target_link_libraries(CsMultimedia_gst_mediaplayer
         ${GSTREAMER_INTERFACES_LIBRARIES}
      )
   endif()

   target_include_directories(
      CsMultimedia_gst_mediaplayer
      PRIVATE
      ${GSTREAMER_INCLUDE_DIR}
      ${GLIB2_INCLUDES}
   )

   target_compile_definitions(CsMultimedia_gst_mediaplayer
      PRIVATE
      -DIN_TRUE
      -DQT_PLUGIN
   )

   set_target_properties(CsMultimedia_gst_audiodecoder PROPERTIES PREFIX "")
   set_target_properties(CsMultimedia_gst_camerabin    PROPERTIES PREFIX "")
   set_target_properties(CsMultimedia_gst_mediaplayer  PROPERTIES PREFIX "")

   install(TARGETS CsMultimedia_gst_audiodecoder DESTINATION ${CMAKE_INSTALL_LIBDIR})
   install(TARGETS CsMultimedia_gst_camerabin    DESTINATION ${CMAKE_INSTALL_LIBDIR})
   install(TARGETS CsMultimedia_gst_mediaplayer  DESTINATION ${CMAKE_INSTALL_LIBDIR})
endif()
