import QtQuick
import QtQuick3D

// Simplified Circle component for QtQuick3D
Node {
    id: root

    property real radius: 1.0
    property real linewidth: 2.0
    property color color: "#232323"

    // Simple circle using a torus model
    Model {
        source: "#Cylinder"
        scale: Qt.vector3d(radius * 2, 0.01, radius * 2)

        materials: PrincipledMaterial {
            baseColor: root.color
            metalness: 0.0
            roughness: 1.0
        }

        // Make it a ring by using instancing/custom geometry
        // For now, using a simple thin cylinder as approximation
    }
}
