#!/bin/bash
# Please add flex_install_dir/bin to the PATH systems variable
# To target flash player 10.2 use flex_sdk_4.5.1.21328A

COMMON_OPT="-library-path+=./assets/assets.swc \
            -library-path+=./lib/OSMF/OSMF.swc \
            -library-path+=./lib/flashls/bin/release/flashlsOSMF.swc \
            -library-path+=./lib/MSAdaptiveStreamingPlugin/1.0.12/MSAdaptiveStreamingPlugin-v1.0.12-osmf2.0.swc \
    -target-player=11.4 \
    -swf-version=17 \
    -optimize=true \
    -use-direct-blit=false \
    -incremental=false \
    -default-background-color=0x000000 \
    -static-link-runtime-shared-libraries=true"

echo "=================================="
echo "Compiling StrobeMediaPlayback.swf - projekktor-StrobeMediaPlayback without static plugins:"
mxmlc ./src/StrobeMediaPlayback.as \
    -source-path ./src  \
    -o ./bin/StrobeMediaPlayback.swf \
    $COMMON_OPT \
    -debug=false \
    -define=CONFIG::LOGGING,false \
    -define=CONFIG::DEBUG,false \
    -define=CONFIG::FLASH_10_1,true \
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
    -debug=false \
    -define=CONFIG::LOGGING,false \
    -define=CONFIG::DEBUG,false \
    -define=CONFIG::FLASH_10_1,true \
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
    -debug=false \
    -define=CONFIG::LOGGING,false \
    -define=CONFIG::DEBUG,false \
    -define=CONFIG::FLASH_10_1,true \
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
    -debug=false \
    -define=CONFIG::LOGGING,false \
    -define=CONFIG::DEBUG,false \
    -define=CONFIG::FLASH_10_1,true \
    -define=CONFIG::MSS,true \
    -define=CONFIG::HLS,true \
    -define=CONFIG::STATIC_PLUGINS,true
    
echo 
echo "=================================="
echo
echo "Compiling StrobeMediaPlayback_hls_mss_debug.swf - projekktor-StrobeMediaPlayback with HLS & MSS static plugins debug version:"
mxmlc ./src/StrobeMediaPlayback.as \
    -source-path ./src  \
    -o ./bin/StrobeMediaPlayback_hls_mss_debug.swf \
    $COMMON_OPT \
    -debug=true \
    -define=CONFIG::LOGGING,true \
    -define=CONFIG::DEBUG,true \
    -define=CONFIG::FLASH_10_1,true \
    -define=CONFIG::MSS,true \
    -define=CONFIG::HLS,true \
    -define=CONFIG::STATIC_PLUGINS,true
echo 
echo "=================================="