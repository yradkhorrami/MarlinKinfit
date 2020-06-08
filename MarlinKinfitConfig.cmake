##############################################################################
# cmake configuration file for MarlinKinfit
#
# requires:
#   MacroCheckPackageLibs.cmake for checking package libraries
#
# returns following variables:
#
#   MarlinKinfit_FOUND      : set to TRUE if MarlinKinfit found
#       if FIND_PACKAGE called with REQUIRED and COMPONENTS arguments
#       MarlinKinfit_FOUND is only set to TRUE if ALL components are also found
#       if REQUIRED is NOT set components may or may not be available
#
#   MarlinKinfit_ROOT       : path to this MarlinKinfit installation
#   MarlinKinfit_VERSION    : package version
#   MarlinKinfit_LIBRARIES  : list of MarlinKinfit libraries (NOT including COMPONENTS)
#   MarlinKinfit_INCLUDE_DIRS  : list of paths to be used with INCLUDE_DIRECTORIES
#   MarlinKinfit_LIBRARY_DIRS  : list of paths to be used with LINK_DIRECTORIES
#   MarlinKinfit_COMPONENT_LIBRARIES      : list of MarlinKinfit component libraries
#   MarlinKinfit_${COMPONENT}_FOUND       : set to TRUE or FALSE for each library
#   MarlinKinfit_${COMPONENT}_LIBRARY     : path to individual libraries
#   MarlinKinfit_${COMPONENT}_LIB_DEPENDS : individual library dependencies
#
# @author Jan Engels, Desy
##############################################################################

SET( MarlinKinfit_ROOT "/afs/desy.de/group/flc/pool/radkhory/MarlinKinfit" )
SET( MarlinKinfit_VERSION "0.6.0" )


# ---------- include dirs -----------------------------------------------------
# do not store find results in cache
SET( MarlinKinfit_INCLUDE_DIRS MarlinKinfit_INCLUDE_DIRS-NOTFOUND )
MARK_AS_ADVANCED( MarlinKinfit_INCLUDE_DIRS )

FIND_PATH( MarlinKinfit_INCLUDE_DIRS
	NAMES BaseFitter.h
	PATHS ${MarlinKinfit_ROOT}/include
	NO_DEFAULT_PATH
)


# ---------- libraries --------------------------------------------------------
INCLUDE( "/cvmfs/ilc.desy.de/sw/x86_64_gcc82_sl6/ilcutil/v01-06/cmakemodules/MacroCheckPackageLibs.cmake" )

# only standard libraries should be passed as arguments to CHECK_PACKAGE_LIBS
# additional components are set by cmake in variable PKG_FIND_COMPONENTS
# first argument should be the package name
CHECK_PACKAGE_LIBS( MarlinKinfit MarlinKinfit )




# ---------- libraries dependencies -------------------------------------------
# this sets MarlinKinfit_${COMPONENT}_LIB_DEPENDS variables
INCLUDE( "${MarlinKinfit_ROOT}/lib/cmake/MarlinKinfitLibDeps.cmake" )
 



# ---------- final checking ---------------------------------------------------
INCLUDE( FindPackageHandleStandardArgs )
# set MARLINKINFIT_FOUND to TRUE if all listed variables are TRUE and not empty
# MarlinKinfit_COMPONENT_VARIABLES will be set if FIND_PACKAGE is called with REQUIRED argument
FIND_PACKAGE_HANDLE_STANDARD_ARGS( MarlinKinfit DEFAULT_MSG MarlinKinfit_ROOT MarlinKinfit_INCLUDE_DIRS MarlinKinfit_LIBRARIES ${MarlinKinfit_COMPONENT_VARIABLES} )

SET( MarlinKinfit_FOUND ${MARLINKINFIT_FOUND} )

