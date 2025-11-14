import QtQuick
import QtQuick3D

// Simplified Line component for QtQuick3D
Node {
    id: root

    property real linewidth: 2.0
    property color color: "#232323"

    Model {
        source: "#Cube"
        scale: Qt.vector3d(linewidth / 100.0, 1.0, linewidth / 100.0)

        materials: PrincipledMaterial {
            baseColor: root.color
            metalness: 0.0
            roughness: 1.0
        }
    }
}
