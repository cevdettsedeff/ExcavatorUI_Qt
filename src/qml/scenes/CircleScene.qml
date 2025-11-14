import QtQuick
import QtQuick3D
import "../components/3d"

Node {
    id: root

    Component.onCompleted: {
        console.log("=== CIRCLE SCENE DEBUG (QtQuick3D) ===")
        console.log("CircleScene created")
        console.log("  radius:", radius)
        console.log("  height:", height)
        console.log("  Machine1 pos:", machine1.pos)
        console.log("  Machine2 pos:", machine2.pos)
    }

    property real cRatio: .96
    property real iRatio: .895
    property real radius: .5 * cRatio
    property real height: .66
    property real iHeight: .6
    property real bHeight: iHeight/5
    property real lw: 3.
    property real eps:1e-3
    property alias pos1: machine1.pos
    property alias pos2: machine2.pos

    property alias machine1: machine1

    // Lighting
    DirectionalLight {
        eulerRotation: Qt.vector3d(-45, 45, 0)
        brightness: 1.0
        castsShadow: true
    }

    DirectionalLight {
        eulerRotation: Qt.vector3d(45, -45, 0)
        brightness: 0.5
    }

    Excavator {
        id: machine1
        radius: root.radius
        y: height-iHeight+bHeight/2
    }

    Excavator {
        id: machine2
        pos: 180
        radius: root.radius
        y: height-iHeight+bHeight/2
    }

    StandBoard {
        scale: Qt.vector3d(.06*radius, bHeight, 1.)
        position: Qt.vector3d(.87*root.radius*Math.cos(machine1.pos * Math.PI / 180),
                              height-iHeight+bHeight/2,
                              -.87*root.radius*Math.sin(machine1.pos * Math.PI / 180))
        eulerRotation: Qt.vector3d(90, machine1.pos, 0)
    }

    StandBoard {
        color: "#f1f3de"
        scale: Qt.vector3d(.06*radius, bHeight, 1.)
        position: Qt.vector3d(.87*root.radius*Math.cos(machine2.pos * Math.PI / 180),
                              height-iHeight+bHeight/2,
                              -.87*root.radius*Math.sin(machine2.pos * Math.PI / 180))
        eulerRotation: Qt.vector3d(90, machine2.pos, 0)
    }

    Circle {
        linewidth: lw
        radius: root.radius
    }

    MinePlane {
        id: mine
        radius: root.radius * cRatio
        position: Qt.vector3d(0,-4e-2,0)
    }

    Line {
        linewidth: lw
        eulerRotation: Qt.vector3d(90, 0, 0)
        position: Qt.vector3d(-radius, height/2, 0)
        scale: Qt.vector3d(1, height, 1)
    }

    Line {
        linewidth: lw
        eulerRotation: Qt.vector3d(90, 0, 0)
        position: Qt.vector3d(radius, height/2, 0)
        scale: Qt.vector3d(1, height, 1)
    }

    Line {
        linewidth: lw
        eulerRotation: Qt.vector3d(90, 0, 0)
        position: Qt.vector3d(-radius*iRatio, height-iHeight/2, 0)
        scale: Qt.vector3d(1, iHeight, 1)
    }

    Line {
        linewidth: lw
        eulerRotation: Qt.vector3d(90, 0, 0)
        position: Qt.vector3d(radius*iRatio, height-iHeight/2, 0)
        scale: Qt.vector3d(1, iHeight, 1)
    }

    Circle {
        linewidth: lw
        radius: root.radius*iRatio
        position: Qt.vector3d(0, height-iHeight, 0)
    }

    HalfCircle {
        linewidth: lw
        radius: root.radius*iRatio
        position: Qt.vector3d(0, height-iHeight+bHeight/2, 0)
    }

    Circle {
        linewidth: lw
        radius: root.radius
        position: Qt.vector3d(0, height, 0)
    }

    Circle {
        linewidth: lw
        radius: root.radius*iRatio
        position: Qt.vector3d(0, height+eps, 0)
    }
}
