import QtQuick
import QtQuick3D
import "../components/3d"

Node {
    id: root

    Component.onCompleted: {
        console.log("=== SIDE SCENE DEBUG (QtQuick3D) ===")
        console.log("SideScene created")
        console.log("  radius:", radius)
        console.log("  height:", height)
    }

    property real cRatio: .96
    property real iRatio: .895
    property real radius: .5 * cRatio
    property real height: .66
    property real iHeight: .6
    property real bHeight: iHeight / 5
    property real lw: 3.
    property real eps: 1e-3

    // Lighting
    DirectionalLight {
        eulerRotation: Qt.vector3d(-45, 0, 0)
        brightness: 1.0
        castsShadow: true
    }

    DirectionalLight {
        eulerRotation: Qt.vector3d(45, 180, 0)
        brightness: 0.5
    }

    Excavator {
        id: machine1
        radius: root.radius
        y: 0
        modelScale: 0.025
        customX: 0.3
        customZ: 0
        pos: 0  // Fixed position, no rotation
    }
}
