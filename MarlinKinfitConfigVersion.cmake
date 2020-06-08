##############################################################################
# this file is parsed when FIND_PACKAGE is called with version argument
#
# @author Jan Engels, Desy IT
##############################################################################


SET( ${PACKAGE_FIND_NAME}_VERSION_MAJOR 0 )
SET( ${PACKAGE_FIND_NAME}_VERSION_MINOR 6 )
SET( ${PACKAGE_FIND_NAME}_VERSION_PATCH 0 )


INCLUDE( "/cvmfs/ilc.desy.de/sw/x86_64_gcc82_sl6/ilcutil/v01-06/cmakemodules/MacroCheckPackageVersion.cmake" )
CHECK_PACKAGE_VERSION( ${PACKAGE_FIND_NAME} 0.6.0 )

