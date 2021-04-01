list(APPEND MULTIMEDIA_PRIVATE_INCLUDES
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/directshow_plugin.h

   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/camera/dscamera_global.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/camera/dscamera_service.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/camera/dscamera_control.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/camera/dscamera_session.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/camera/dscamera_viewfindersettingscontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/camera/dscamera_imageprocessingcontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/camera/dsimage_capturecontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/camera/dsvideo_renderer.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/camera/dsvideo_devicecontrol.h

   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/kernel/directshoweventloop.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/kernel/directshowpinenum.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/kernel/directshowmediatype.h

   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/dsplayer_global.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/directshowioreader.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/directshowiosource.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/directshowmediatypelist.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/directshowplayercontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/directshowplayerservice.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/directshowsamplescheduler.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/directshowvideorenderercontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/mediasamplevideobuffer.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/videosurfacefilter.h

   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/directshowaudioendpointcontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/directshowmetadatacontrol.h
   ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/vmr9videowindowcontrol.h
)

if(CMAKE_SYSTEM_NAME MATCHES "Windows")

   add_library(CsMultimedia_DirectShow MODULE "")
   add_library(CopperSpice::CsMultimedia_DirectShow ALIAS CsMultimedia_DirectShow)

   set_target_properties(CsMultimedia_DirectShow PROPERTIES OUTPUT_NAME CsMultimedia_DirectShow${BUILD_ABI} PREFIX "")

   target_sources(CsMultimedia_DirectShow
      PRIVATE

      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/directshow_plugin.cpp

      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/camera/dscamera_service.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/camera/dscamera_control.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/camera/dscamera_session.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/camera/dscamera_viewfindersettingscontrol.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/camera/dscamera_imageprocessingcontrol.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/camera/dsimage_capturecontrol.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/camera/dsvideo_renderer.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/camera/dsvideo_devicecontrol.cpp

      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/kernel/directshoweventloop.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/kernel/directshowmediatype.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/kernel/directshowpinenum.cpp

      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/directshowioreader.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/directshowiosource.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/directshowmediatypelist.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/directshowplayercontrol.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/directshowplayerservice.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/directshowsamplescheduler.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/directshowvideorenderercontrol.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/mediasamplevideobuffer.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/videosurfacefilter.cpp

      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/directshowaudioendpointcontrol.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/directshowmetadatacontrol.cpp
      ${CS_SOURCE_DIR}/src/plugins/multimedia/mediaservices/directshow/player/vmr9videowindowcontrol.cpp
    )

    target_link_libraries(CsMultimedia_DirectShow
       CsCore
       CsGui
       CsNetwork
       CsMultimedia
       strmiids
       dmoguids
       uuid
       ole32
       oleaut32
       msdmo
       gdi32
    )

    target_compile_definitions(CsMultimedia_DirectShow
       PRIVATE
       -DQT_PLUGIN
       -DQMEDIA_DIRECTSHOW_CAMERA
       -DQMEDIA_DIRECTSHOW_PLAYER
       -DNO_DSHOW_STRSAFE
    )

    install(TARGETS CsMultimedia_DirectShow DESTINATION ${CMAKE_INSTALL_LIBDIR})
endif()
