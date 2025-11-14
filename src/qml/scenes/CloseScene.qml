import QtQuick
import QtQuick3D
import "../components/3d"

Node {
    id: root

    Component.onCompleted: {
        console.log("=== CLOSE SCENE DEBUG (QtQuick3D) ===")
        console.log("CloseScene created")
        console.log("  radius:", radius)
        console.log("  height:", height)
    }

    property real cRatio: .96
    property real iRatio: .895
    property real radius: 1. * cRatio
    property real height: .66
    property real iHeight: .6
    property real bHeight: iHeight / 3
    property real lw: 3.
    property real eps: 1e-3
    property real pos: 0.

    // Lighting
    DirectionalLight {
        eulerRotation: Qt.vector3d(-30, 60, 0)
        brightness: 1.2
        castsShadow: true
    }

    DirectionalLight {
        eulerRotation: Qt.vector3d(30, -60, 0)
        brightness: 0.6
    }

    Excavator {
        id: machine1
        radius: root.radius
        y: height - iHeight + bHeight / 2
        modelScale: 0.03
        customX: .86 * root.radius
        customZ: 0
        pos: 0  // Fixed position, no rotation
    }

    StandBoard {
        scale: Qt.vector3d(.08 * radius, bHeight, 1.)
        position: Qt.vector3d(.86 * root.radius, height - iHeight + bHeight / 2, 0)
        eulerRotation: Qt.vector3d(90, 0, 0)
    }

    Circle {
        linewidth: lw
        radius: root.radius
    }

    MinePlane {
        id: mine
        radius: root.radius * cRatio
        rotation: -root.pos
        eulerRotation: Qt.vector3d(0, -root.pos, 0)
        position: Qt.vector3d(0, -6e-2, 0)
    }

    Line {
        linewidth: lw
        eulerRotation: Qt.vector3d(90, 0, 0)
        position: Qt.vector3d(radius, height / 2, 0)
        scale: Qt.vector3d(1, height, 1)
    }

    Line {
        linewidth: lw
        eulerRotation: Qt.vector3d(90, 0, 0)
        position: Qt.vector3d(radius * iRatio, height - iHeight / 2, 0)
        scale: Qt.vector3d(1, iHeight, 1)
    }
}
