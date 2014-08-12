#.rst:
# CPackIFW
# --------
#
# .. _QtIFW: http://qt-project.org/doc/qtinstallerframework/index.html
#
# This module looks for the location of the command line utilities supplied with
# the Qt Installer Framework (QtIFW_).
#
# The module also defines several commands to control the behavior of the
# CPack ``IFW`` generator.
#
#
# Overview
# ^^^^^^^^
#
# CPack ``IFW`` generator helps you create online and offline
# binary cross-platform installers with a graphical user interface.
#
# CPack IFW generator prepare project installation and generate configuration
# and meta information for QtIFW_ tools.
#
# The QtIFW_ provides a set of tools and utilities to create
# installers for the supported desktop Qt platforms: Linux, Microsoft Windows,
# and Mac OS X.
#
# To use CPack ``IFW`` generator you must also install QtIFW_.
#
# Variables
# ^^^^^^^^^
#
# You can use the following variables to change behavior of CPack ``IFW`` generator.
#
# Package
# """""""
#
# .. variable:: CPACK_IFW_PACKAGE_TITLE
#
#  Name of the installer as displayed on the title bar.
#  By default used :variable:`CPACK_PACKAGE_DESCRIPTION_SUMMARY`
#
# .. variable:: CPACK_IFW_PACKAGE_PUBLISHER
#
#  Publisher of the software (as shown in the Windows Control Panel).
#  By default used :variable:`CPACK_PACKAGE_VENDOR`
#
# .. variable:: CPACK_IFW_PRODUCT_URL
#
#  URL to a page that contains product information on your web site.
#
# .. variable:: CPACK_IFW_PACKAGE_ICON
#
#  Filename for a custom installer icon. The actual file is '.icns' (Mac OS X),
#  '.ico' (Windows). No functionality on Unix.
#
# .. variable:: CPACK_IFW_PACKAGE_WINDOW_ICON
#
#  Filename for a custom window icon in PNG format for the Installer application.
#
# .. variable:: CPACK_IFW_PACKAGE_LOGO
#
#  Filename for a logo used as QWizard::LogoPixmap.
#
# .. variable:: CPACK_IFW_TARGET_DIRECTORY
#
#  Default target directory for installation.
#  By default used "@ApplicationsDir@/:variable:`CPACK_PACKAGE_INSTALL_DIRECTORY`"
#
#  You can use predefined variables.
#
# .. variable:: CPACK_IFW_ADMIN_TARGET_DIRECTORY
#
#  Default target directory for installation with administrator rights.
#
#  You can use predefined variables.
#
# .. variable:: CPACK_IFW_PACKAGE_GROUP
#
#  The group, which will be used to configure the root package
#
# .. variable:: CPACK_IFW_PACKAGE_NAME
#
#  The root package name, which will be used if configuration group is not
#  specified
#
# Components
# """"""""""
#
# .. variable:: CPACK_IFW_RESOLVE_DUPLICATE_NAMES
#
#  Resolve duplicate names when installing components with groups.
#
# .. variable:: CPACK_IFW_PACKAGES_DIRECTORIES
#
#  Additional prepared packages dirs that will be used to resolve
#  dependent components.
#
# Advanced
# """"""""
#
# .. variable:: CPACK_IFW_BINARYCREATOR_EXECUTABLE
#
#  The path to "binarycreator" command line client.
#
#  This variable is cached and can be configured user if need.
#
# .. variable:: CPACK_IFW_BINARYCREATOR_EXECUTABLE_FOUND
#
#  True if the "binarycreator" command line client was found.
#
# .. variable:: CPACK_IFW_REPOGEN_EXECUTABLE
#
#  The path to "repogen" command line client.
#
#  This variable is cached and can be configured user if need.
#
# .. variable:: CPACK_IFW_REPOGEN_EXECUTABLE_FOUND
#
#  True if the "repogen" command line client was found.
#
# Commands
# ^^^^^^^^^
#
# The module defines the following commands:
#
# --------------------------------------------------------------------------
#
# .. command:: cpack_ifw_configure_component
#
# Sets the arguments specific to the CPack IFW generator.
#
# ::
#
#   cpack_ifw_configure_component(<compname> [COMMON]
#                       [NAME <name>]
#                       [VERSION <version>]
#                       [SCRIPT <script>]
#                       [PRIORITY <priority>]
#                       [DEPENDS <com_id> ...]
#                       [LICENSES <display_name> <file_path> ...])
#
# This command should be called after cpack_add_component command.
#
# ``COMMON`` if set, then the component will be packaged and installed as part
# of a group to which he belongs.
#
# ``VERSION`` is version of component.
# By default used :variable:`CPACK_PACKAGE_VERSION`.
#
# ``SCRIPT`` is relative or absolute path to operations script
# for this component.
#
# ``NAME`` is used to create domain-like identification for this component.
# By default used origin component name.
#
# ``PRIORITY`` is priority of the component in the tree.
#
# ``DEPENDS`` list of dependency component identifiers in QtIFW_ style.
#
# ``LICENSES`` pair of <display_name> and <file_path> of license text for this
# component. You can specify more then one license.
#
# --------------------------------------------------------------------------
#
# .. command:: cpack_ifw_configure_component_group
#
# Sets the arguments specific to the CPack IFW generator.
#
# ::
#
#   cpack_ifw_configure_component_group(<grpname>
#                       [VERSION <version>]
#                       [NAME <name>]
#                       [SCRIPT <script>]
#                       [PRIORITY <priority>]
#                       [LICENSES <display_name> <file_path> ...])
#
# This command should be called after cpack_add_component_group command.
#
# ``VERSION`` is version of component group.
# By default used :variable:`CPACK_PACKAGE_VERSION`.
#
# ``NAME`` is used to create domain-like identification for this component group.
# By default used origin component group name.
#
# ``SCRIPT`` is relative or absolute path to operations script
# for this component group.
#
# ``PRIORITY`` is priority of the component group in the tree.
#
# ``LICENSES`` pair of <display_name> and <file_path> of license text for this
# component group. You can specify more then one license.
#
# Example usage
# ^^^^^^^^^^^^^
#
# .. code-block:: cmake
#
#    set(CPACK_PACKAGE_NAME "MyPackage")
#    set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "MyPackage Installation Example")
#    set(CPACK_PACKAGE_VERSION "1.0.0")
#
#    include(CPack)
#    include(CPackIFW)
#
#    cpack_add_component(myapp
#        DISPLAY_NAME "MyApp"
#        DESCRIPTION "My Application")
#    cpack_ifw_configure_component(myapp
#        VERSION "1.2.3"
#        SCRIPT "operations.qs")
#
#
# Online installer
# ^^^^^^^^^^^^^^^^
#
# By defaul CPack IFW generator make offline installer. This means that all
# components will be packaged into a binary file.
#
# To make a component downloaded, you must set the ``DOWNLOADED`` option in
# :command:`cpack_add_component`.
#
# Then you would use the command :command:`cpack_configure_downloads`.
# If you set ``ALL`` option all components will be downloaded.
#
# CPack IFW generator create "repository" dir in current binary dir. You
# would copy content of this dir to specified ``site``.
#
# See Also
# ^^^^^^^^
#
# Qt Installer Framework Manual:
#
#  Index page
#   http://qt-project.org/doc/qtinstallerframework/index.html
#
#  Component Scripting
#   http://qt-project.org/doc/qtinstallerframework/scripting.html
#
#  Predefined Variables
#   http://qt-project.org/doc/qtinstallerframework/scripting.html#predefined-variables
#
# Download Qt Installer Framework for you platform from Qt Project site:
#  http://download.qt-project.org/official_releases/qt-installer-framework/
#

#=============================================================================
# Copyright 2014 Kitware, Inc.
# Copyright 2014 Konstantin Podsvirov <konstantin@podsvirov.pro>
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distribute this file outside of CMake, substitute the full
#  License text for the above reference.)

#=============================================================================
# Search Qt Installer Framework tools
#=============================================================================

# Default path

if(WIN32)
        set(_CPACK_IFW_PATHS
            "$ENV{HOMEDRIVE}/Qt"
            "C:/Qt"
        )
else()
        set(_CPACK_IFW_PATHS
            "$ENV{HOME}/Qt"
            "/opt/Qt"
        )
endif()

set(_CPACK_IFW_SUFFIXES
        "QtIFW-1.7.0/bin"
        "QtIFW-1.6.0/bin"
        "QtIFW-1.5.0/bin"
        "QtIFW-1.4.0/bin"
        "QtIFW-1.3.0/bin"
)

# Look for 'binarycreator'

if(NOT CPACK_IFW_BINARYCREATOR_EXECUTABLE_FOUND)

find_program(CPACK_IFW_BINARYCREATOR_EXECUTABLE
  NAMES binarycreator
  PATHS ${_CPACK_IFW_PATHS}
  PATH_SUFFIXES ${_CPACK_IFW_SUFFIXES}
  DOC "QtIFW binarycreator command line client"
  )
mark_as_advanced(CPACK_IFW_BINARYCREATOR_EXECUTABLE)

if(EXISTS ${CPACK_IFW_BINARYCREATOR_EXECUTABLE})
  set(CPACK_IFW_BINARYCREATOR_EXECUTABLE_FOUND 1)
endif()

endif() # NOT CPACK_IFW_BINARYCREATOR_EXECUTABLE_FOUND

# Look for 'repogen'

if(NOT CPACK_IFW_REPOGEN_EXECUTABLE_FOUND)

find_program(CPACK_IFW_REPOGEN_EXECUTABLE
  NAMES repogen
  PATHS ${_CPACK_IFW_PATHS}
  PATH_SUFFIXES ${_CPACK_IFW_SUFFIXES}
  DOC "QtIFW repogen command line client"
  )
mark_as_advanced(CPACK_IFW_REPOGEN_EXECUTABLE)

if(EXISTS ${CPACK_IFW_REPOGEN_EXECUTABLE})
  set(CPACK_IFW_REPOGEN_EXECUTABLE_FOUND 1)
endif()

endif() # NOT CPACK_IFW_REPOGEN_EXECUTABLE_FOUND

#
## Next code is included only once
#

if(NOT CPackIFW_CMake_INCLUDED)
set(CPackIFW_CMake_INCLUDED 1)

#=============================================================================
# Macro definition
#=============================================================================

# Macro definition based on CPackComponent

if(NOT CPackComponent_CMake_INCLUDED)
    include(CPackComponent)
endif()

if(NOT __CMAKE_PARSE_ARGUMENTS_INCLUDED)
    include(CMakeParseArguments)
endif()

# Resolve full filename for script file
macro(_cpack_ifw_resolve_script _variable)
  set(_ifw_script_macro ${_variable})
  set(_ifw_script_file ${${_ifw_script_macro}})
  if(DEFINED ${_ifw_script_macro})
    get_filename_component(${_ifw_script_macro} ${_ifw_script_file} ABSOLUTE)
    set(_ifw_script_file ${${_ifw_script_macro}})
    if(NOT EXISTS ${_ifw_script_file})
      message(WARNING "CPack IFW: script file \"${_ifw_script_file}\" is not exists")
      set(${_ifw_script_macro})
    endif()
  endif()
endmacro()

# Resolve full path to lisense file
macro(_cpack_ifw_resolve_lisenses _variable)
  if(${_variable})
    set(_ifw_license_file FALSE)
    set(_ifw_licenses_fix)
    foreach(_ifw_licenses_arg ${${_variable}})
      if(_ifw_license_file)
        get_filename_component(_ifw_licenses_arg "${_ifw_licenses_arg}" ABSOLUTE)
        set(_ifw_license_file FALSE)
      else()
        set(_ifw_license_file TRUE)
      endif()
      list(APPEND _ifw_licenses_fix "${_ifw_licenses_arg}")
    endforeach(_ifw_licenses_arg)
    set(${_variable} "${_ifw_licenses_fix}")
  endif()
endmacro()

# Macro for configure component
macro(cpack_ifw_configure_component compname)

  string(TOUPPER ${compname} _CPACK_IFWCOMP_UNAME)

  set(_IFW_OPT COMMON)
  set(_IFW_ARGS VERSION SCRIPT NAME PRIORITY)
  set(_IFW_MULTI_ARGS DEPENDS LICENSES)
  cmake_parse_arguments(CPACK_IFW_COMPONENT_${_CPACK_IFWCOMP_UNAME} "${_IFW_OPT}" "${_IFW_ARGS}" "${_IFW_MULTI_ARGS}" ${ARGN})

  _cpack_ifw_resolve_script(CPACK_IFW_COMPONENT_${_CPACK_IFWCOMP_UNAME}_SCRIPT)
  _cpack_ifw_resolve_lisenses(CPACK_IFW_COMPONENT_${_CPACK_IFWCOMP_UNAME}_LICENSES)

  set(_CPACK_IFWCOMP_STR "\n# Configuration for IFW component \"${compname}\"\n")

  foreach(_IFW_ARG_NAME ${_IFW_OPT})
  cpack_append_option_set_command(
    CPACK_IFW_COMPONENT_${_CPACK_IFWCOMP_UNAME}_${_IFW_ARG_NAME}
    _CPACK_IFWCOMP_STR)
  endforeach()

  foreach(_IFW_ARG_NAME ${_IFW_ARGS})
  cpack_append_string_variable_set_command(
    CPACK_IFW_COMPONENT_${_CPACK_IFWCOMP_UNAME}_${_IFW_ARG_NAME}
    _CPACK_IFWCOMP_STR)
  endforeach()

  foreach(_IFW_ARG_NAME ${_IFW_MULTI_ARGS})
  cpack_append_variable_set_command(
    CPACK_IFW_COMPONENT_${_CPACK_IFWCOMP_UNAME}_${_IFW_ARG_NAME}
    _CPACK_IFWCOMP_STR)
  endforeach()

  if(CPack_CMake_INCLUDED)
    file(APPEND "${CPACK_OUTPUT_CONFIG_FILE}" "${_CPACK_IFWCOMP_STR}")
  endif()

endmacro()

# Macro for configure group
macro(cpack_ifw_configure_component_group grpname)

  string(TOUPPER ${grpname} _CPACK_IFWGRP_UNAME)

  set(_IFW_OPT)
  set(_IFW_ARGS NAME VERSION SCRIPT PRIORITY)
  set(_IFW_MULTI_ARGS LICENSES)
  cmake_parse_arguments(CPACK_IFW_COMPONENT_GROUP_${_CPACK_IFWGRP_UNAME} "${_IFW_OPT}" "${_IFW_ARGS}" "${_IFW_MULTI_ARGS}" ${ARGN})

  _cpack_ifw_resolve_script(CPACK_IFW_COMPONENT_GROUP_${_CPACK_IFWGRP_UNAME}_SCRIPT)
  _cpack_ifw_resolve_lisenses(CPACK_IFW_COMPONENT_GROUP_${_CPACK_IFWGRP_UNAME}_LICENSES)

  set(_CPACK_IFWGRP_STR "\n# Configuration for IFW component group \"${grpname}\"\n")

  foreach(_IFW_ARG_NAME ${_IFW_ARGS})
  cpack_append_string_variable_set_command(
    CPACK_IFW_COMPONENT_GROUP_${_CPACK_IFWGRP_UNAME}_${_IFW_ARG_NAME}
    _CPACK_IFWGRP_STR)
  endforeach()

  foreach(_IFW_ARG_NAME ${_IFW_MULTI_ARGS})
  cpack_append_variable_set_command(
    CPACK_IFW_COMPONENT_GROUP_${_CPACK_IFWGRP_UNAME}_${_IFW_ARG_NAME}
    _CPACK_IFWGRP_STR)
  endforeach()

  if(CPack_CMake_INCLUDED)
    file(APPEND "${CPACK_OUTPUT_CONFIG_FILE}" "${_CPACK_IFWGRP_STR}")
  endif()
endmacro()

endif() # NOT CPackIFW_CMake_INCLUDED
