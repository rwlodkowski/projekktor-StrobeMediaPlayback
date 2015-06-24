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
echo
echo "Compiling StrobeMediaPlayback.swf - projekktor-StrobeMediaPlayback"
mxmlc ./src/StrobeMediaPlayback.as \
    -source-path ./src  \
    -o ./bin/relase/StrobeMediaPlayback.swf \
    $COMMON_OPT \
    $RELEASE_OPT \
    $TARGET_11_4_OPT 

echo 
echo "=================================="
echo
echo "Compiling StrobeMediaPlayback.swf - projekktor-StrobeMediaPlayback debug version:"
mxmlc ./src/StrobeMediaPlayback.as \
    -source-path ./src  \
    -o ./bin/debug/StrobeMediaPlayback.swf \
    $COMMON_OPT \
    $DEBUG_OPT \
    $TARGET_11_4_OPT 

echo 
echo "=================================="
echo
echo "Compiling StrobeMediaPlayback.swf - projekktor-StrobeMediaPlayback target 10.2 for Linux:"
mxmlc ./src/StrobeMediaPlayback.as \
    -source-path ./src  \
    -o ./bin/relase/StrobeMediaPlayback_target_10.2.swf \
    $COMMON_OPT \
    $RELEASE_OPT \
    $TARGET_10_2_OPT

echo 
echo "=================================="
echo
echo "Compiling StrobeMediaPlayback_debug.swf - projekktor-StrobeMediaPlayback debug version target 10.2 for Linux:"
mxmlc ./src/StrobeMediaPlayback.as \
    -source-path ./src  \
    -o ./bin/debug/StrobeMediaPlayback_debug_target_10.2.swf \
    $COMMON_OPT \
    $DEBUG_OPT \
    $TARGET_10_2_OPT
    
echo 
echo "=================================="