# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /root/rtabmap-tango

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/rtabmap-tango/build/armeabi-v7a

# Utility rule file for NativeRTABMap-apk-debug.

# Include the progress variables for this target.
include app/android/CMakeFiles/NativeRTABMap-apk-debug.dir/progress.make

app/android/CMakeFiles/NativeRTABMap-apk-debug:
	cd /root/rtabmap-tango/build/armeabi-v7a/app/android && /usr/bin/ant -file /root/rtabmap-tango/build/armeabi-v7a/app/android/build.xml debug

NativeRTABMap-apk-debug: app/android/CMakeFiles/NativeRTABMap-apk-debug
NativeRTABMap-apk-debug: app/android/CMakeFiles/NativeRTABMap-apk-debug.dir/build.make

.PHONY : NativeRTABMap-apk-debug

# Rule to build all files generated by this target.
app/android/CMakeFiles/NativeRTABMap-apk-debug.dir/build: NativeRTABMap-apk-debug

.PHONY : app/android/CMakeFiles/NativeRTABMap-apk-debug.dir/build

app/android/CMakeFiles/NativeRTABMap-apk-debug.dir/clean:
	cd /root/rtabmap-tango/build/armeabi-v7a/app/android && $(CMAKE_COMMAND) -P CMakeFiles/NativeRTABMap-apk-debug.dir/cmake_clean.cmake
.PHONY : app/android/CMakeFiles/NativeRTABMap-apk-debug.dir/clean

app/android/CMakeFiles/NativeRTABMap-apk-debug.dir/depend:
	cd /root/rtabmap-tango/build/armeabi-v7a && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/rtabmap-tango /root/rtabmap-tango/app/android /root/rtabmap-tango/build/armeabi-v7a /root/rtabmap-tango/build/armeabi-v7a/app/android /root/rtabmap-tango/build/armeabi-v7a/app/android/CMakeFiles/NativeRTABMap-apk-debug.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : app/android/CMakeFiles/NativeRTABMap-apk-debug.dir/depend

