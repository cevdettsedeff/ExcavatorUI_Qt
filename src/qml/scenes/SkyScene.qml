import QtQuick
import QtQuick3D
import "../components/3d"

Node {
    id: root

    property real cRatio: .96
    property real iRatio: .895
    property real radius: .5 * cRatio
    property real height: .66
    property real iHeight: .6
    property real bHeight: iHeight/5
    property real lw: 3.
    property real eps:1e-3

    // Lighting
    DirectionalLight {
        eulerRotation: Qt.vector3d(-90, 0, 0)
        brightness: 1.0
    }

    MinePlane {
        id: mine
        radius: root.radius
    }
}
