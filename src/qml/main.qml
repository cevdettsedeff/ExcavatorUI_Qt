import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls.Material
import QtQuick3D
import QtQuick.LocalStorage
import "components/ui"
import "scenes"
import "utils"

ApplicationWindow {
    id: app
    visible: true
    width: 800
    height: 600 + 75

    title: "EkskavatorUI - Qt6"

    property int spacing: 4
    property int sceneWidth: 800
    property int sceneHeight: 600

    Item {
        id: toolbar
        y: spacing
        x: spacing
        height: 75 - spacing
        width: parent.width - 2*spacing

        RowLayout {
            spacing: app.spacing
            anchors.fill: parent

            Rectangle {
                height: parent.height
                width: (app.width-5*app.spacing)/3
                border.width: 2
                border.color: "#232323"

                RowLayout {
                    spacing: 2
                    anchors.centerIn: parent
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

                    ColorButton {
                        discription: "Dolaşma"
                        status: "No. 003"
                        color: "white"
                    }
                    ColorButton {
                        discription: "Mod"
                        status: "Sondaj"
                        color: "#029fd4"
                    }
                    ColorButton {
                        discription: "Duruş"
                        status: "Konum"
                        color: "#069c5d"
                    }
                }
            }

            Rectangle {
                height: parent.height
                width: (app.width-5*app.spacing)/3
                border.width: 2
                border.color: "#232323"

                RowLayout {
                    spacing: app.spacing
                    anchors.centerIn: parent
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

                    ColorFuel {
                        discription: "Güç kaynağı voltajı"
                        unit: "V"
                        color: "#069c5d"
                        value: 430 + parseInt(Math.sin(time.value)*10 + circle.pos1 / 10)
                        minValue: 0
                        maxValue: 500
                        implicitWidth: app.width/7
                    }
                    ColorFuel {
                        id: currentFuel
                        discription: "Motor akımı"
                        unit: "A"
                        color: "#da6566"
                        value: 120 + parseInt(da)
                        minValue: 0
                        maxValue: 500
                        implicitWidth: app.width/7

                        property int lastAngle: 90
                        property int da: 0
                    }
                }
            }
            Rectangle {
                height: parent.height
                width: (app.width-5*app.spacing)/3
                border.width: 2
                border.color: "#232323"

                RowLayout {
                    spacing: app.spacing
                    anchors.centerIn: parent
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

                    ColorFuel {
                        discription: "P1 basıncı"
                        unit: "M㎩"
                        color: "#3ea47f"
                        value: 20.0
                        minValue: 0
                        maxValue: 50
                        implicitWidth: app.width/7
                    }
                    ColorFuel {
                        discription: "P2 basıncı"
                        unit: "M㎩"
                        color: "#5b5521"
                        value: 1.0
                        minValue: 0
                        maxValue: 50
                        implicitWidth: app.width/7
                    }
                }
            }
        }
    }

    Item {
        y: 75
        x: 0
        width: parent.width
        height: parent.height - y

        // Top-left: Circle Scene
        Rectangle {
            x: spacing
            y: spacing
            height: (parent.height-3*spacing)/2
            width: (parent.width-3*spacing)/2
            border.width: 2
            border.color: "#232323"

            View3D {
                id: view3d1
                anchors.fill: parent
                anchors.margins: 2

                environment: SceneEnvironment {
                    clearColor: "#3a4446"
                    backgroundMode: SceneEnvironment.Color
                    antialiasingMode: SceneEnvironment.MSAA
                    antialiasingQuality: SceneEnvironment.High
                }

                camera: PerspectiveCamera {
                    position: Qt.vector3d(0, 1.5, 2.5)
                    eulerRotation: Qt.vector3d(-30, 0, 0)
                }

                CircleScene {
                    id: circle
                }
            }
        }

        // Top-right: Close Scene
        Rectangle {
            x: spacing*2+width
            y: spacing
            height: (parent.height-3*spacing)/2
            width: (parent.width-3*spacing)/2
            border.width: 2
            border.color: "#232323"

            View3D {
                id: view3d2
                anchors.fill: parent
                anchors.margins: 2

                environment: SceneEnvironment {
                    clearColor: "#3a4446"
                    backgroundMode: SceneEnvironment.Color
                    antialiasingMode: SceneEnvironment.MSAA
                    antialiasingQuality: SceneEnvironment.High
                }

                camera: PerspectiveCamera {
                    position: Qt.vector3d(0, 0.5, 1.5)
                    eulerRotation: Qt.vector3d(-20, 0, 0)
                }

                CloseScene {
                    pos: circle.pos1
                }
            }
        }

        // Bottom-left: Sky Scene
        Rectangle {
            x: spacing
            y: spacing*2+height
            height: (parent.height-3*spacing)/2
            width: (parent.width-3*spacing)/2
            border.width: 2
            border.color: "#232323"

            Rectangle {
                anchors.centerIn: parent
                height: Math.min(parent.height, parent.width)-24
                width: Math.min(parent.height, parent.width)-24
                radius: width
                border.width: 2
                border.color: "#232323"
                color: "transparent"

                View3D {
                    id: skyScene
                    anchors.fill: parent
                    z: -1

                    environment: SceneEnvironment {
                        clearColor: "#3a4446"
                        backgroundMode: SceneEnvironment.Color
                        antialiasingMode: SceneEnvironment.MSAA
                        antialiasingQuality: SceneEnvironment.High
                    }

                    camera: PerspectiveCamera {
                        position: Qt.vector3d(0, 2.0, 0)
                        eulerRotation: Qt.vector3d(-90, 0, 0)
                    }

                    SkyScene {
                    }
                }

                Rectangle {
                    anchors.centerIn: parent
                    height: width
                    width: parent.width * circle.iRatio
                    radius: width
                    border.width: 2
                    border.color: "#232323"
                    color: "transparent"
                }

                Rectangle {
                    x: parent.width/2*(1+Math.cos(circle.pos1*Math.PI/180))-width/2
                    y: parent.height/2*(1-Math.sin(circle.pos1*Math.PI/180))-width/2
                    height: width
                    width: 12
                    radius: width
                    border.width: 2
                    border.color: "#232323"
                    color: "#009edb"
                }

                Rectangle {
                    x: parent.width/2*(1+Math.cos(circle.pos2*Math.PI/180))-width/2
                    y: parent.height/2*(1-Math.sin(circle.pos2*Math.PI/180))-width/2
                    height: width
                    width: 12
                    radius: width
                    border.width: 2
                    border.color: "#232323"
                    color: "#f1f3de"
                }
            }
        }

        // Bottom-right: Side Scene
        Rectangle {
            x: spacing*2+width
            y: spacing*2+height
            height: (parent.height-3*spacing)/2
            width: (parent.width-3*spacing)/2
            border.width: 2
            border.color: "#232323"

            Rectangle {
                anchors.fill: parent
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                anchors.topMargin: 4
                anchors.bottomMargin: 60
                color: "#3a4446"
            }

            View3D {
                id: view3d4
                anchors.fill: parent
                anchors.margins: 2

                environment: SceneEnvironment {
                    clearColor: "#3a4446"
                    backgroundMode: SceneEnvironment.Color
                    antialiasingMode: SceneEnvironment.MSAA
                    antialiasingQuality: SceneEnvironment.High
                }

                camera: PerspectiveCamera {
                    position: Qt.vector3d(1.5, 0, 0)
                    eulerRotation: Qt.vector3d(0, 90, 0)
                }

                SideScene {
                }
            }

            Rectangle {
                height: 20
                width: parent.width/2
                border.width: 2
                border.color: "#232323"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20

                Rectangle {
                    height: parent.height - 4
                    x: 2
                    anchors.verticalCenter: parent.verticalCenter
                    width: Math.min(parent.width * circle.machine1.angle0 / -80, parent.width - 4)
                    color: "#069676"
                }

                Text {
                    text: "0"
                    y: -15
                }

                Text {
                    text: "80"
                    y: -15
                    x: parent.width
                }
            }
        }
    }

    property var db

    Component.onCompleted: {
        db = LocalStorage.openDatabaseSync("ExcavatorDB", "1.0", "Excavator Historical Data", 1000);

        db.transaction(function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS position(time FLOAT, pos FLOAT)');
        })
    }

    Time {
        id: time

        property real previousValue: 0.

        onValueChanged: {
            currentFuel.da = (currentFuel.da * 7 +
                              (currentFuel.lastAngle - circle.machine1.angle1) * -50
                             )/8
            currentFuel.lastAngle = circle.machine1.angle1

            if (value - previousValue > 15) {
                db.transaction(function(tx) {
                    var rs = tx.executeSql('SELECT * FROM position');
                    if (rs.rows.length)
                        console.log("The position 15s before of machine 1 is %1".arg(rs.rows.item(rs.rows.length-1).pos))
                    tx.executeSql('INSERT INTO position VALUES(?, ?)', [ time.value, circle.pos1 ]);
                })
                previousValue = value
            }
        }
    }
}
