# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

add_definitions(-DQUICK_TEST_SOURCE_DIR=\"${CMAKE_CURRENT_SOURCE_DIR}\")
add_definitions(-DUNIT_TEST)
add_definitions(-DMVPN_DUMMY)

get_filename_component(MVPN_SOURCE_DIR ${CMAKE_SOURCE_DIR}/src ABSOLUTE)

include_directories(${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${MVPN_SOURCE_DIR})

qt_add_executable(qml_tests EXCLUDE_FROM_ALL)
set_target_properties(qml_tests PROPERTIES FOLDER "Tests")
add_dependencies(build_tests qml_tests)

target_link_libraries(qml_tests PRIVATE
    Qt6::Gui
    Qt6::WebSockets
    Qt6::Widgets
    Qt6::Qml
    Qt6::Quick
    Qt6::QuickTest
)

target_link_libraries(qml_tests PRIVATE glean lottie nebula translations)

# VPN Client source files
target_sources(qml_tests PRIVATE
    ${MVPN_SOURCE_DIR}/closeeventhandler.cpp
    ${MVPN_SOURCE_DIR}/closeeventhandler.h
    ${MVPN_SOURCE_DIR}/constants.h
    ${MVPN_SOURCE_DIR}/hawkauth.cpp
    ${MVPN_SOURCE_DIR}/hawkauth.h
    ${MVPN_SOURCE_DIR}/hkdf.cpp
    ${MVPN_SOURCE_DIR}/hkdf.h
    ${MVPN_SOURCE_DIR}/inspector/inspectorhandler.h
    ${MVPN_SOURCE_DIR}/logger.cpp
    ${MVPN_SOURCE_DIR}/logger.h
    ${MVPN_SOURCE_DIR}/loghandler.cpp
    ${MVPN_SOURCE_DIR}/loghandler.h
    ${MVPN_SOURCE_DIR}/models/feature.cpp
    ${MVPN_SOURCE_DIR}/models/feature.h
    ${MVPN_SOURCE_DIR}/models/featuremodel.cpp
    ${MVPN_SOURCE_DIR}/models/featuremodel.h
    ${MVPN_SOURCE_DIR}/models/server.cpp
    ${MVPN_SOURCE_DIR}/models/whatsnewmodel.cpp
    ${MVPN_SOURCE_DIR}/models/whatsnewmodel.h
    ${MVPN_SOURCE_DIR}/mozillavpn.h
    ${MVPN_SOURCE_DIR}/networkmanager.cpp
    ${MVPN_SOURCE_DIR}/networkmanager.h
    ${MVPN_SOURCE_DIR}/networkrequest.cpp
    ${MVPN_SOURCE_DIR}/networkrequest.h
    ${MVPN_SOURCE_DIR}/settingsholder.cpp
    ${MVPN_SOURCE_DIR}/settingsholder.h
    ${MVPN_SOURCE_DIR}/theme.cpp
    ${MVPN_SOURCE_DIR}/theme.h
    ${MVPN_SOURCE_DIR}/update/updater.cpp
    ${MVPN_SOURCE_DIR}/update/updater.h
    ${MVPN_SOURCE_DIR}/update/versionapi.cpp
    ${MVPN_SOURCE_DIR}/update/versionapi.h
    ${MVPN_SOURCE_DIR}/update/webupdater.cpp
    ${MVPN_SOURCE_DIR}/update/webupdater.h
)

# VPN Client UI resources
target_sources(qml_tests PRIVATE
    ${MVPN_SOURCE_DIR}/ui/ui.qrc
)

# QML test source files
target_sources(qml_tests PRIVATE
    helper.cpp
    helper.h
    main.cpp
    mocconstants.cpp
    mocmozillavpn.cpp
    ../unit/mocinspectorhandler.cpp
)

if(WIN32)
    if(${Qt6_VERSION} VERSION_GREATER_EQUAL 6.3.0)
        message(WARNING "Remove the Qt6 windows hack!")
    else()
        target_sources(qml_tests PRIVATE qt6winhack.qrc)
    endif()
endif()

## Add the tests to be run.
if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
    list(APPEND QML_TEST_ARGS -platform offscreen)
endif()
add_test(NAME qml_tests COMMAND qml_tests ${QML_TEST_ARGS})
