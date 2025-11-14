import QtQuick
import QtQuick3D

// Simplified StandBoard component for QtQuick3D
Model {
    id: root

    property color color: "#009edb"

    source: "#Cube"

    materials: PrincipledMaterial {
        baseColor: root.color
        metalness: 0.3
        roughness: 0.7
    }
}
