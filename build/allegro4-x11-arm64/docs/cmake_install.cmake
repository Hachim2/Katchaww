# Install script for directory: /Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/third_party/allegro4/docs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/lib/allegro4")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/doc/allegro-4.4.4" TYPE FILE FILES
    "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/AUTHORS"
    "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/THANKS"
    "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/CHANGES"
    "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/readme.txt"
    "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/txt/abi.txt"
    "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/txt/addons.txt"
    "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/txt/ahack.txt"
    "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/txt/allegro.txt"
    "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/txt/api.txt"
    "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/txt/const.txt"
    "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/txt/dat.txt"
    "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/txt/dat2c.txt"
    "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/txt/dat2s.txt"
    "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/txt/datafile.txt"
    "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/txt/faq.txt"
    "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/txt/grabber.txt"
    "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/txt/help.txt"
    "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/txt/license.txt"
    "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/txt/makedoc.txt"
    "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/txt/mistakes.txt"
    "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/txt/packfile.txt"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/Users/emmanuellefort/Desktop/ECOLE/ECE/Informatique1/projets2/build/allegro4-x11-arm64/docs/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
