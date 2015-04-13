#!/bin/bash
# Please add flex_install_dir/bin to the PATH systems variable
# To target flash player 10.2 use flex_sdk_4.5.1.21328A

COMMON_OPT="-library-path+=./assets/assets.swc \
            -library-path+=./lib/OSMF/OSMF.swc \
    -optimize=true \
    -use-direct-blit=false \
    -incremental=false \
    -default-background-color=0x000000 \
    -static-link-runtime-shared-libraries=true \
    -define=CONFIG::FLASH_10_1,true"

RELEASE_OPT="-library-path+=./lib/flashls/bin/release/flashlsOSMF.swc \
             -debug=false \
             -define=CONFIG::LOGGING,false \
             -define=CONFIG::DEBUG,false"
    
DEBUG_OPT="-library-path+=./lib/flashls/bin/debug/flashlsOSMF.swc \
           -debug=true \
           -define=CONFIG::LOGGING,true \
           -define=CONFIG::DEBUG,true"

# For latest release of Adobe Flash for Linux
TARGET_10_2_OPT="-target-player=10.2 \
                 -swf-version=11 \
                 -library-path+=./lib/MSAdaptiveStreamingPlugin/1.0.10/MSAdaptiveStreamingPlugin-v1.0.10-osmf2.0.swc"

# For newest Adobe Flash
TARGET_11_4_OPT="-target-player=11.4 \
                 -swf-version=17 \
                 -library-path+=./lib/MSAdaptiveStreamingPlugin/1.0.12/MSAdaptiveStreamingPlugin-v1.0.12-osmf2.0.swc"

echo "=================================="
echo "Compiling StrobeMediaPlayback.swf - projekktor-StrobeMediaPlayback without static plugins:"
mxmlc ./src/StrobeMediaPlayback.as \
    -source-path ./src  \
    -o ./bin/StrobeMediaPlayback.swf \
    $COMMON_OPT \
    $RELEASE_OPT \
    $TARGET_11_4_OPT \
    -define=CONFIG::MSS,false \
    -define=CONFIG::HLS,false \
    -define=CONFIG::STATIC_PLUGINS,false
    
echo 
echo "=================================="
echo
echo "Compiling StrobeMediaPlayback_hls.swf - projekktor-StrobeMediaPlayback with HLS static plugin:"
mxmlc ./src/StrobeMediaPlayback.as \
    -source-path ./src  \
    -o ./bin/StrobeMediaPlayback_hls.swf \
    $COMMON_OPT \
    $RELEASE_OPT \
    $TARGET_11_4_OPT \
    -define=CONFIG::MSS,false \
    -define=CONFIG::HLS,true \
    -define=CONFIG::STATIC_PLUGINS,true

echo 
echo "=================================="
echo
echo "Compiling StrobeMediaPlayback_mss.swf - projekktor-StrobeMediaPlayback with MSS static plugin:"
mxmlc ./src/StrobeMediaPlayback.as \
    -source-path ./src  \
    -o ./bin/StrobeMediaPlayback_mss.swf \
    $COMMON_OPT \
    $RELEASE_OPT \
    $TARGET_11_4_OPT \
    -define=CONFIG::MSS,true \
    -define=CONFIG::HLS,false \
    -define=CONFIG::STATIC_PLUGINS,true
    
echo 
echo "=================================="
echo
echo "Compiling StrobeMediaPlayback_hls_mss.swf - projekktor-StrobeMediaPlayback with HLS & MSS static plugins:"
mxmlc ./src/StrobeMediaPlayback.as \
    -source-path ./src  \
    -o ./bin/StrobeMediaPlayback_hls_mss.swf \
    $COMMON_OPT \
    $RELEASE_OPT \
    $TARGET_11_4_OPT \
    -define=CONFIG::MSS,true \
    -define=CONFIG::HLS,true \
    -define=CONFIG::STATIC_PLUGINS,true

echo 
echo "=================================="
echo
echo "Compiling StrobeMediaPlayback_debug.swf - projekktor-StrobeMediaPlayback without static plugins debug version:"
mxmlc ./src/StrobeMediaPlayback.as \
    -source-path ./src  \
    -o ./bin/StrobeMediaPlayback_debug.swf \
    $COMMON_OPT \
    $DEBUG_OPT \
    $TARGET_11_4_OPT \
    -define=CONFIG::MSS,false \
    -define=CONFIG::HLS,false \
    -define=CONFIG::STATIC_PLUGINS,false
echo 
echo "=================================="
echo
echo "Compiling StrobeMediaPlayback_hls_mss_debug.swf - projekktor-StrobeMediaPlayback with HLS & MSS static plugins debug version:"
mxmlc ./src/StrobeMediaPlayback.as \
    -source-path ./src  \
    -o ./bin/StrobeMediaPlayback_hls_mss_debug.swf \
    $COMMON_OPT \
    $DEBUG_OPT \
    $TARGET_11_4_OPT \
    -define=CONFIG::MSS,true \
    -define=CONFIG::HLS,true \
    -define=CONFIG::STATIC_PLUGINS,true
echo 
echo "=================================="
echo "Compiling StrobeMediaPlayback.swf - projekktor-StrobeMediaPlayback without static plugins - for Linux:"
mxmlc ./src/StrobeMediaPlayback.as \
    -source-path ./src  \
    -o ./bin/StrobeMediaPlayback_target_10.2.swf \
    $COMMON_OPT \
    $RELEASE_OPT \
    $TARGET_10_2_OPT \
    -define=CONFIG::MSS,false \
    -define=CONFIG::HLS,false \
    -define=CONFIG::STATIC_PLUGINS,false
    
echo 
echo "=================================="
echo
echo "Compiling StrobeMediaPlayback_hls.swf - projekktor-StrobeMediaPlayback with HLS static plugin - for Linux:"
mxmlc ./src/StrobeMediaPlayback.as \
    -source-path ./src  \
    -o ./bin/StrobeMediaPlayback_hls_target_10.2.swf \
    $COMMON_OPT \
    $RELEASE_OPT \
    $TARGET_10_2_OPT \
    -define=CONFIG::MSS,false \
    -define=CONFIG::HLS,true \
    -define=CONFIG::STATIC_PLUGINS,true

echo 
echo "=================================="
echo
echo "Compiling StrobeMediaPlayback_mss.swf - projekktor-StrobeMediaPlayback with MSS static plugin - for Linux:"
mxmlc ./src/StrobeMediaPlayback.as \
    -source-path ./src  \
    -o ./bin/StrobeMediaPlayback_mss_target_10.2.swf \
    $COMMON_OPT \
    $RELEASE_OPT \
    $TARGET_10_2_OPT \
    -define=CONFIG::MSS,true \
    -define=CONFIG::HLS,false \
    -define=CONFIG::STATIC_PLUGINS,true
    
echo 
echo "=================================="
echo
echo "Compiling StrobeMediaPlayback_hls_mss.swf - projekktor-StrobeMediaPlayback with HLS & MSS static plugins - for Linux:"
mxmlc ./src/StrobeMediaPlayback.as \
    -source-path ./src  \
    -o ./bin/StrobeMediaPlayback_hls_mss_target_10.2.swf \
    $COMMON_OPT \
    $RELEASE_OPT \
    $TARGET_10_2_OPT \
    -define=CONFIG::MSS,true \
    -define=CONFIG::HLS,true \
    -define=CONFIG::STATIC_PLUGINS,true

echo 
echo "=================================="
echo
echo "Compiling StrobeMediaPlayback_debug.swf - projekktor-StrobeMediaPlayback without static plugins debug version - for Linux:"
mxmlc ./src/StrobeMediaPlayback.as \
    -source-path ./src  \
    -o ./bin/StrobeMediaPlayback_debug_target_10.2.swf \
    $COMMON_OPT \
    $DEBUG_OPT \
    $TARGET_10_2_OPT \
    -define=CONFIG::MSS,false \
    -define=CONFIG::HLS,false \
    -define=CONFIG::STATIC_PLUGINS,false
echo 
echo "=================================="
echo
echo "Compiling StrobeMediaPlayback_hls_mss_debug.swf - projekktor-StrobeMediaPlayback with HLS & MSS static plugins debug version - for Linux:"
mxmlc ./src/StrobeMediaPlayback.as \
    -source-path ./src  \
    -o ./bin/StrobeMediaPlayback_hls_mss_debug_target_10.2.swf \
    $COMMON_OPT \
    $DEBUG_OPT \
    $TARGET_10_2_OPT \
    -define=CONFIG::MSS,true \
    -define=CONFIG::HLS,true \
    -define=CONFIG::STATIC_PLUGINS,true
echo 
echo "=================================="