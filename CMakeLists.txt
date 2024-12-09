cmake_minimum_required(VERSION 3.16)

project(TeslaInfotainmentClone VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)
set(ANDROID_RES_DIR ${CMAKE_SOURCE_DIR}/android/res)
find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appTeslaInfotainmentClone
    main.cpp
     MANUAL_FINALIZATION
)


qt_add_qml_module(appTeslaInfotainmentClone
    URI TeslaInfotainmentClone
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES UI/BottomBar/BottomBar.qml
        QML_FILES UI/LeftBar/LeftBar.qml
        QML_FILES UI/RightBar/RightBar.qml
        QML_FILES UI/NavigationBar/NavigationBar.qml
        RESOURCES res.qrc
        SOURCES Controllers/system.h Controllers/system.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appTeslaInfotainmentClone PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appTeslaInfotainmentClone
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)
set_property(TARGET app${PROJECT_NAME} APPEND PROPERTY
    QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android
)
target_link_libraries(appTeslaInfotainmentClone
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appTeslaInfotainmentClone
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

qt_finalize_executable(app${PROJECT_NAME})
