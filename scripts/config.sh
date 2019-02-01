# Configures environment variables required for other scripts to work properly.
# Always source this file before using the scripts with the output directory as parameter.
# See help for required positional arguments.

if [ $# != 1 ] || [ "$1" == '-h' ] || [ "$1" == '--help' ]; then
    echo "Usage: source $0 prefix_path"
    echo "  example: source $0 /home/user/ros_android/output"
    exit 1
fi

# Configure the Android NDK and toolchain
export ANDROID_ABI=armeabi-v7a
export ANDROID_STL=c++_static       # or c++_shared, see https://developer.android.com/ndk/guides/cpp-support
export ANDROID_PLATFORM=android-24

# Enable this value for debug build
#CMAKE_BUILD_TYPE=Debug
export CMAKE_BUILD_TYPE=Release

# Define the number of simultaneous jobs to trigger for the different
# tasks that allow it. Use the number of available processors in the
# system.
export PARALLEL_JOBS=$(nproc)

# Export common paths
export OUTPUT_DIR="$1"
export TARGET_DIR=$OUTPUT_DIR/target
export LIBS_DIR=$OUTPUT_DIR/libs
export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export BASE_DIR=$SCRIPT_DIR/../
