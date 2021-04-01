list(APPEND MULTIMEDIA_PRIVATE_INCLUDES
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcameradebug.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcameraserviceplugin.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcameracontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcamerametadatacontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfimagecapturecontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcameraservice.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcamerasession.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfstoragelocation.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfaudioinputselectorcontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcamerainfocontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfmediavideoprobecontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcamerarenderercontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcameradevicecontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcamerafocuscontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcameraexposurecontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcamerautility.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcameraviewfindersettingscontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfimageencodercontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcameraflashcontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfvideoencodersettingscontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfmediacontainercontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfaudioencodersettingscontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfmediarecordercontrol.h

   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfdisplaylink.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfmediaplayercontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfmediaplayermetadatacontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfmediaplayerservice.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfmediaplayersession.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfmediaplayerserviceplugin.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfvideooutput.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfvideowindowcontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfvideowidgetcontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfvideowidget.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfvideorenderercontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfvideoframerenderer.h
)

if(WITH_MULTIMEDIA AND CMAKE_SYSTEM_NAME MATCHES "Darwin")

   # plugin 1
   add_library(CsMultimedia_avf_camera MODULE "")
   add_library(CopperSpice::CsMultimedia_avf_camera ALIAS CsMultimedia_avf_camera)

   set_target_properties(CsMultimedia_avf_camera PROPERTIES OUTPUT_NAME CsMultimedia_avf_camera${BUILD_ABI} PREFIX "")

   target_sources(CsMultimedia_avf_camera
      PRIVATE
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcameraserviceplugin.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcameracontrol.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcamerametadatacontrol.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfimagecapturecontrol.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcameraservice.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcamerasession.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfstoragelocation.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfaudioinputselectorcontrol.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcamerainfocontrol.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfmediavideoprobecontrol.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcameradevicecontrol.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcamerarenderercontrol.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcamerafocuscontrol.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcameraexposurecontrol.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcamerautility.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcameraviewfindersettingscontrol.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfimageencodercontrol.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfcameraflashcontrol.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfvideoencodersettingscontrol.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfmediacontainercontrol.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfaudioencodersettingscontrol.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/camera/avfmediarecordercontrol.mm
   )

   target_link_libraries(CsMultimedia_avf_camera
      PRIVATE
      CsCore
      CsGui
      CsNetwork
      CsMultimedia
      "-framework AudioToolbox"
      "-framework AVFoundation"
      "-framework Foundation"
      "-framework CoreAudio"
      "-framework CoreMedia"
      "-framework QuartzCore"
   )

   target_compile_definitions(CsMultimedia_avf_camera
      PRIVATE
      -DQT_PLUGIN
      -DQMEDIA_AVF_CAMERA
   )

   # plugin 2
   add_library(CsMultimedia_avf_mediaplayer MODULE "")
   add_library(CopperSpice::CsMultimedia_avf_mediaplayer ALIAS CsMultimedia_avf_mediaplayer)

   set_target_properties(CsMultimedia_avf_mediaplayer PROPERTIES OUTPUT_NAME CsMultimedia_avf_mediaplayer${BUILD_ABI} PREFIX "")

   target_sources(CsMultimedia_avf_mediaplayer
      PRIVATE
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfdisplaylink.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfmediaplayercontrol.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfmediaplayermetadatacontrol.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfmediaplayerservice.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfmediaplayerserviceplugin.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfmediaplayersession.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfvideooutput.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfvideowindowcontrol.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfvideowidgetcontrol.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfvideowidget.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfvideorenderercontrol.mm
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/avfoundation/mediaplayer/avfvideoframerenderer.mm
   )

   target_link_libraries(CsMultimedia_avf_mediaplayer
      PRIVATE
      CsCore
      CsGui
      CsNetwork
      CsMultimedia
      "-framework AVFoundation"
      "-framework CoreMedia"
      "-framework QuartzCore"
      "-framework AppKit"
      "-framework OpenGL"
   )

   target_compile_definitions(CsMultimedia_avf_mediaplayer
      PRIVATE
      -DQT_PLUGIN
      -DQMEDIA_AVF_MEDIAPLAYER
   )

   install(TARGETS CsMultimedia_avf_camera       DESTINATION ${CMAKE_INSTALL_LIBDIR})
   install(TARGETS CsMultimedia_avf_mediaplayer  DESTINATION ${CMAKE_INSTALL_LIBDIR})
endif()
