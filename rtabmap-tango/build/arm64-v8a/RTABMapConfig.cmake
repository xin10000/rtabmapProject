# - Config file for the RTABMap package
# Components:
#  core    (required)
#  gui     (optional)
#  utilite (required)
# It defines the following variables
#  RTABMap_INCLUDE_DIRS - include directories for RTABMap
#  RTABMap_LIBRARIES    - libraries to link against
#  RTABMap_CORE         - core library
#  RTABMap_UTILITE      - utilite library
#  RTABMap_GUI          - gui library (set if RTABMap is built with Qt)

# Compute paths
get_filename_component(RTABMap_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
set(RTABMap_INCLUDE_DIRS "/root/rtabmap-tango/corelib/include;/root/rtabmap-tango/guilib/include;/root/rtabmap-tango/utilite/include")

#core lib
find_library(RTABMap_CORE_RELEASE NAMES rtabmap_core NO_DEFAULT_PATH HINTS /root/rtabmap-tango/lib /root/rtabmap-tango/bin)
find_library(RTABMap_CORE_DEBUG NAMES rtabmap_cored NO_DEFAULT_PATH HINTS /root/rtabmap-tango/lib /root/rtabmap-tango/bin)

IF(RTABMap_CORE_DEBUG AND RTABMap_CORE_RELEASE)
   SET(RTABMap_CORE
      debug ${RTABMap_CORE_DEBUG}
      optimized ${RTABMap_CORE_RELEASE}
   )
ELSEIF(RTABMap_CORE_DEBUG)
   SET(RTABMap_CORE ${RTABMap_CORE_DEBUG})
ELSE()
   SET(RTABMap_CORE ${RTABMap_CORE_RELEASE})
ENDIF()

#utilite lib
find_library(RTABMap_UTILITE_RELEASE NAMES rtabmap_utilite NO_DEFAULT_PATH HINTS /root/rtabmap-tango/lib /root/rtabmap-tango/bin)
find_library(RTABMap_UTILITE_DEBUG NAMES rtabmap_utilited NO_DEFAULT_PATH HINTS /root/rtabmap-tango/lib /root/rtabmap-tango/bin)

IF(RTABMap_UTILITE_DEBUG AND RTABMap_UTILITE_RELEASE)
   SET(RTABMap_UTILITE
      debug ${RTABMap_UTILITE_DEBUG}
      optimized ${RTABMap_UTILITE_RELEASE}
   )
ELSEIF(RTABMap_UTILITE_DEBUG)
   SET(RTABMap_UTILITE ${RTABMap_UTILITE_DEBUG})
ELSE()
   SET(RTABMap_UTILITE ${RTABMap_UTILITE_RELEASE})
ENDIF()

set(RTABMap_LIBRARIES ${RTABMap_CORE} ${RTABMap_UTILITE})

list(LENGTH RTABMap_FIND_COMPONENTS RTABMap_FIND_COMPONENTS_LENGTH)
set(WITH_GUI ON)
if(${RTABMap_FIND_COMPONENTS_LENGTH} GREATER 0)
   list (FIND RTABMap_FIND_COMPONENTS "gui" _index)
   if (${_index} EQUAL -1)
      set(WITH_GUI OFF)
   endif()
endif(${RTABMap_FIND_COMPONENTS_LENGTH} GREATER 0)


#gui lib (OFF if RTAB-Map is not built with Qt)
if(OFF AND ${WITH_GUI})
   find_library(RTABMap_GUI_RELEASE NAMES rtabmap_gui NO_DEFAULT_PATH HINTS /root/rtabmap-tango/lib /root/rtabmap-tango/bin)
   find_library(RTABMap_GUI_DEBUG NAMES rtabmap_guid NO_DEFAULT_PATH HINTS /root/rtabmap-tango/lib /root/rtabmap-tango/bin)
   
   IF(RTABMap_GUI_DEBUG AND RTABMap_GUI_RELEASE)
      SET(RTABMap_GUI
         debug ${RTABMap_GUI_DEBUG}
         optimized ${RTABMap_GUI_RELEASE}
      )
   ELSEIF(RTABMap_GUI_RELEASE)
      SET(RTABMap_GUI ${RTABMap_GUI_RELEASE})
   ELSEIF(RTABMap_GUI_DEBUG)
      SET(RTABMap_GUI ${RTABMap_GUI_DEBUG})
   ENDIF()
   
   set(RTABMap_LIBRARIES ${RTABMap_LIBRARIES} ${RTABMap_GUI})
elseif(${WITH_GUI})
   MESSAGE(ERROR "Asked for \"gui\" module but RTABMap hasn't been built with gui support.")
endif()

# Dependencies
if(false AND ${WITH_GUI})
   find_package(VTK COMPONENTS vtkGUISupportQt NO_MODULE) # to define vtkGUISupportQt target
endif(false AND ${WITH_GUI})
SET(RTABMap_LIBRARIES ${RTABMap_LIBRARIES} "/opt/android-ndk-r14/platforms/android-21/arch-arm64/usr/lib/libz.so;/opt/android/arm64-v8a/lib/libg2o_core.a;/opt/android/arm64-v8a/lib/libg2o_types_slam2d.a;/opt/android/arm64-v8a/lib/libg2o_types_slam3d.a;/opt/android/arm64-v8a/lib/libg2o_types_sba.a;/opt/android/arm64-v8a/lib/libg2o_stuff.a;/opt/android/arm64-v8a/lib/libg2o_solver_csparse.a;/opt/android/arm64-v8a/lib/libg2o_csparse_extension.a;/opt/android/arm64-v8a/lib/libg2o_ext_csparse.a")

#backward compatibilities
set(RTABMAP_CORE ${RTABMap_CORE})
set(RTABMAP_UTILITE ${RTABMap_UTILITE})
if(RTABMap_GUI)
   set(RTABMAP_GUI ${RTABMap_GUI})
   set(RTABMAP_QT_VERSION )
endif(RTABMap_GUI)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(RTABMap DEFAULT_MSG RTABMap_LIBRARIES RTABMap_INCLUDE_DIRS)
mark_as_advanced(RTABMap_LIBRARIES RTABMap_INCLUDE_DIRS RTABMap_LIBRARY_DIRS)
