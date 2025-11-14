import QtQuick
import QtQuick3D

// Simplified MinePlane component for QtQuick3D
Model {
    id: root

    property real radius: 1.0
    property real rotation: 0

    source: "#Rectangle"
    scale: Qt.vector3d(radius * 4, radius * 4, 1)
    eulerRotation: Qt.vector3d(-90, rotation, 0)

    materials: PrincipledMaterial {
        baseColor: "#3a4446"
        metalness: 0.1
        roughness: 0.9

        // Optional: Add height/texture map if available
        baseColorMap: Texture {
            source: "qrc:/resources/textures/heightmap.png"
        }
    }
}
