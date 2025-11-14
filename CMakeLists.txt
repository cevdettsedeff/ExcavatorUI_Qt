cmake_minimum_required(VERSION 3.16)

project(ExcavatorUI VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# Find Qt6 packages
find_package(Qt6 6.2 REQUIRED COMPONENTS
    Core
    Quick
    Quick3D
    Sql
    Widgets
)

# Add executable
qt_add_executable(ExcavatorUI
    src/main.cpp
    qml.qrc
)

# Link libraries
target_link_libraries(ExcavatorUI PRIVATE
    Qt6::Core
    Qt6::Quick
    Qt6::Quick3D
    Qt6::Sql
    Qt6::Widgets
)

# Set target properties
set_target_properties(ExcavatorUI PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER com.excavator.ui
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

# Install target
install(TARGETS ExcavatorUI
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
