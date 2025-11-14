import QtQuick
import QtQuick3D

Node {
    id: root

    // Animation properties
    property real pos: Math.random()
    property real angle0: Math.random() * -90
    property real angle1: Math.random() * 30
    property real angle2: Math.random() * 90
    property real radius: 1.0
    property real y: 0.2
    property real modelScale: 0.015

    // Optional custom position overrides
    property real customX: NaN
    property real customZ: NaN

    property vector3d joint0: Qt.vector3d(-11.69973, 1.59875, 1.)
    property vector3d joint1: Qt.vector3d(-22.08812, -5.44126, 1.)

    // Helper function for rotation around point
    function rotateAround(point, angle, axis) {
        var rad = angle * Math.PI / 180
        var result = Qt.matrix4x4()
        result.translate(point.x, point.y, point.z)
        if (axis.z !== 0) result.rotate(angle, 0, 0, 1)
        else if (axis.y !== 0) result.rotate(angle, 0, 1, 0)
        else if (axis.x !== 0) result.rotate(angle, 1, 0, 0)
        result.translate(-point.x, -point.y, -point.z)
        return result
    }

    Component.onCompleted: {
        console.log("=== EXCAVATOR DEBUG (QtQuick3D) ===")
        console.log("Excavator created with:")
        console.log("  pos:", pos)
        console.log("  scale:", modelScale)
        console.log("  y:", y)
        console.log("  radius:", radius)
        var finalX = isNaN(customX) ? .85 * radius * Math.cos(pos * Math.PI / 180) : customX
        var finalZ = isNaN(customZ) ? -.85 * radius * Math.sin(pos * Math.PI / 180) : customZ
        console.log("  Final position: (" + finalX + ", " + y + ", " + finalZ + ")")
    }

    position: Qt.vector3d(
        isNaN(customX) ? .85 * radius * Math.cos(pos * Math.PI / 180) : customX,
        y,
        isNaN(customZ) ? -.85 * radius * Math.sin(pos * Math.PI / 180) : customZ
    )
    eulerRotation: Qt.vector3d(0, pos, 0)
    scale: Qt.vector3d(modelScale, modelScale, modelScale)


    // ------------------ ARM 0 ------------------
    Model {
        id: arm0
        source: "qrc:/resources/models/excavator/excavator_arm0.glb"
        eulerRotation: Qt.vector3d(0, 0, angle0)

        materials: PrincipledMaterial {
            baseColor: "#e7e824"
            metalness: 0.2
            roughness: 0.8
        }

        Component.onCompleted: {
            console.log("ARM0 Model loaded:", source)
        }
    }

    Model {
        id: arm0Wire
        source: "qrc:/resources/models/excavator/excavator_arm0_wire.glb"
        eulerRotation: Qt.vector3d(0, 0, angle0)

        materials: PrincipledMaterial {
            baseColor: "#232323"
            metalness: 0.1
            roughness: 0.9
        }
    }


    // ------------------ ARM 1 ------------------
    Node {
        id: arm1Node

        // Transform calculation for arm1
        property var transformMatrix: {
            var mat = Qt.matrix4x4()
            mat.rotate(angle0, 0, 0, 1)
            var rotMat = rotateAround(joint0, angle1, Qt.vector3d(0,0,1))
            return mat.times(rotMat)
        }

        // Extract position and rotation from matrix
        eulerRotation: Qt.vector3d(0, 0, angle0 + angle1)

        Model {
            id: arm1
            source: "qrc:/resources/models/excavator/excavator_arm1.glb"

            materials: PrincipledMaterial {
                baseColor: "#e7e824"
                metalness: 0.2
                roughness: 0.8
            }
        }

        Model {
            id: arm1Wire
            source: "qrc:/resources/models/excavator/excavator_arm1_wire.glb"

            materials: PrincipledMaterial {
                baseColor: "#232323"
                metalness: 0.1
                roughness: 0.9
            }
        }
    }


    // ------------------ BUCKET ------------------
    Node {
        id: bucketNode

        eulerRotation: Qt.vector3d(0, 0, angle0 + angle1 + angle2)

        Model {
            id: bucket
            source: "qrc:/resources/models/excavator/excavator_bucket.glb"

            materials: PrincipledMaterial {
                baseColor: "#e7e824"
                metalness: 0.2
                roughness: 0.8
            }
        }

        Model {
            id: bucketWire
            source: "qrc:/resources/models/excavator/excavator_bucket_wire.glb"

            materials: PrincipledMaterial {
                baseColor: "#232323"
                metalness: 0.1
                roughness: 0.9
            }
        }
    }


    // ------------------ ANIMATIONS ------------------
    SequentialAnimation {
        running: true
        loops: Animation.Infinite

        PauseAnimation { duration: 2000 }

        NumberAnimation {
            target: root
            property: "angle0"
            from: -60; to: 0
            duration: 3000
            easing.type: Easing.InOutQuad
        }

        PauseAnimation { duration: 1000 }

        NumberAnimation {
            target: root
            property: "angle0"
            from: 0; to: -60
            duration: 3000
            easing.type: Easing.InOutQuad
        }

        PauseAnimation { duration: 1000 }
    }


    SequentialAnimation {
        running: true
        loops: Animation.Infinite

        PauseAnimation { duration: 2000 }

        NumberAnimation {
            target: root
            property: "angle1"
            from: 90; to: 0
            duration: 3000
            easing.type: Easing.InOutQuad
        }

        PauseAnimation { duration: 1000 }

        NumberAnimation {
            target: root
            property: "angle1"
            from: 0; to: 90
            duration: 3000
            easing.type: Easing.InOutQuad
        }

        PauseAnimation { duration: 1000 }
    }


    SequentialAnimation {
        running: true
        loops: Animation.Infinite

        PauseAnimation { duration: 3000 }

        NumberAnimation {
            target: root
            property: "angle2"
            from: 90; to: 0
            duration: 2000
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            target: root
            property: "angle2"
            from: 0; to: 90
            duration: 3000
            easing.type: Easing.InOutQuad
        }

        PauseAnimation { duration: 2000 }
    }


    // POS BEHAVIOR
    Behavior on pos {
        NumberAnimation {
            duration: 1000
            easing.type: Easing.InOutQuad
        }
    }

    Timer {
        running: true
        interval: 10000
        repeat: true
        onTriggered: root.pos += (Math.random() - 0.5) * 180
    }
}
