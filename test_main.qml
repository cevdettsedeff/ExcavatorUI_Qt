// TEMPORARY TEST VERSION - Use CMake build for production!
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls.Material
import QtQuick3D

ApplicationWindow {
    id: app
    visible: true
    width: 800
    height: 600 + 75
    title: "EkskavatorUI - Qt6 (Test Mode)"

    property int spacing: 4

    Rectangle {
        anchors.fill: parent
        color: "#2c3e50"

        Text {
            anchors.centerIn: parent
            text: "ExcavatorUI Qt6\n\n⚠️ Build with CMake to see 3D models\n\nRun:\nmkdir build && cd build\ncmake ..\ncmake --build .\n./ExcavatorUI"
            color: "white"
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
            lineHeight: 1.5
        }

        // Simple 3D test scene
        View3D {
            anchors.centerIn: parent
            width: 400
            height: 400

            environment: SceneEnvironment {
                clearColor: "#3a4446"
                backgroundMode: SceneEnvironment.Color
            }

            PerspectiveCamera {
                position: Qt.vector3d(0, 200, 300)
                eulerRotation: Qt.vector3d(-20, 0, 0)
            }

            DirectionalLight {
                eulerRotation: Qt.vector3d(-45, 45, 0)
                brightness: 1.0
            }

            // Test cube
            Model {
                source: "#Cube"
                scale: Qt.vector3d(2, 2, 2)

                materials: PrincipledMaterial {
                    baseColor: "#e7e824"
                    metalness: 0.2
                    roughness: 0.8
                }

                SequentialAnimation on eulerRotation.y {
                    running: true
                    loops: Animation.Infinite
                    NumberAnimation {
                        from: 0
                        to: 360
                        duration: 3000
                    }
                }
            }
        }

        Text {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 20
            text: "✓ QtQuick3D is working! Build with CMake to load excavator models."
            color: "#2ecc71"
            font.pixelSize: 14
        }
    }
}
