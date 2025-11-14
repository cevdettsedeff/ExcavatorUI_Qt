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

# Add Qt Quick Compiler if available
qt_standard_project_setup()

# Add executable
qt_add_executable(ExcavatorUI
    src/main.cpp
)

# Add QML module
qt_add_qml_module(ExcavatorUI
    URI ExcavatorUI
    VERSION 1.0
    QML_FILES
        src/qml/main.qml
        src/qml/components/ui/ColorButton.qml
        src/qml/components/ui/ColorFuel.qml
        src/qml/components/ui/Palette.qml
        src/qml/components/3d/Excavator.qml
        src/qml/components/3d/Circle.qml
        src/qml/components/3d/HalfCircle.qml
        src/qml/components/3d/Line.qml
        src/qml/components/3d/MinePlane.qml
        src/qml/components/3d/StandBoard.qml
        src/qml/scenes/CircleScene.qml
        src/qml/scenes/CloseScene.qml
        src/qml/scenes/SideScene.qml
        src/qml/scenes/SkyScene.qml
        src/qml/utils/Time.qml
        src/qml/utils/Inputs0.qml
    RESOURCES
        resources/models/excavator/excavator_arm0.glb
        resources/models/excavator/excavator_arm0_wire.glb
        resources/models/excavator/excavator_arm1.glb
        resources/models/excavator/excavator_arm1_wire.glb
        resources/models/excavator/excavator_bucket.glb
        resources/models/excavator/excavator_bucket_wire.glb
        resources/textures/colormap.png
        resources/textures/heightmap.png
        resources/textures/hm.png
        resources/shaders/circle.frag
        resources/shaders/colorframe.frag
        resources/shaders/depthmap.frag
        resources/shaders/depthmap.vert
        resources/shaders/halfcircle.frag
        resources/shaders/line.frag
        resources/shaders/line.vert
        resources/shaders/passthrough.vert
        resources/shaders/passthrough_color.frag
        src/qml/utils/misc.js
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
