import QtQuick as QQ2

import Qt3D.Core
import Qt3D.Render
import Qt3D.Input
import Qt3D.Extras

Entity {
	id: root

	// Animation properties
	property real pos: Math.random()
	property real angle0: Math.random() * -90
	property real angle1: Math.random() * 30
	property real angle2: Math.random() * 90
	property real radius: 1.0
	property real y: 0.2
	property real scale: 0.015

	// Optional custom position overrides (if not set, calculated from pos and radius)
	property real customX: NaN
	property real customZ: NaN

	property vector3d joint0: Qt.vector3d(-11.69973, 1.59875, 1.)
	property vector3d joint1: Qt.vector3d(-22.08812, -5.44126, 1.)

	Component.onCompleted: {
		console.log("=== EXCAVATOR DEBUG ===")
		console.log("Excavator created with:")
		console.log("  pos:", pos)
		console.log("  scale:", scale)
		console.log("  y:", y)
		console.log("  radius:", radius)
		console.log("  customX:", customX, "isNaN:", isNaN(customX))
		console.log("  customZ:", customZ, "isNaN:", isNaN(customZ))
		var finalX = isNaN(customX) ? .85 * radius * Math.cos(pos * Math.PI / 180) : customX
		var finalZ = isNaN(customZ) ? -.85 * radius * Math.sin(pos * Math.PI / 180) : customZ
		console.log("  Final position: (" + finalX + ", " + y + ", " + finalZ + ")")
		console.log("  Root components count:", root.components.length)
	}

	components: [
		Transform {
			id: rootTransform
			scale: root.scale
			translation: Qt.vector3d(
				isNaN(customX) ? .85 * radius * Math.cos(pos * Math.PI / 180) : customX,
				y,
				isNaN(customZ) ? -.85 * radius * Math.sin(pos * Math.PI / 180) : customZ
			)
			rotation: fromAxisAndAngle(Qt.vector3d(0, 1, 0), pos)
		}
	]

	// Arm transforms
	Transform {
		id: transform0
		rotation: fromAxisAndAngle(Qt.vector3d(0, 0, 1), angle0)
	}

	Transform {
		id: transform1
		matrix: transform0.matrix.times(rotateAround(joint0, angle1, Qt.vector3d(0,0,1)))
	}

	Transform {
		id: transform2
		matrix: transform1.matrix.times(rotateAround(joint1, angle2, Qt.vector3d(0,0,1)))
	}


	// ------------------ ARM 0 ------------------
	Entity {
		id: arm0
		Mesh {
			id: arm0Mesh
			source: "file:objects/excavator_arm0.obj"
			onStatusChanged: console.log("ARM0 Mesh status:", status, "source:", source)
		}
		ColorMaterial { id: fillMaterial0; color: "#e7e824" }
		Transform { id: t0; rotation: transform0.rotation }
		components: [arm0Mesh, fillMaterial0, t0]

		Component.onCompleted: {
			console.log("ARM0 Entity created, components:", arm0.components.length)
		}
	}

	Entity {
		id: arm0Wire
		Mesh {
			id: arm0WireMesh
			source: "file:objects/excavator_arm0_wire.obj"
			onStatusChanged: console.log("ARM0 Wire Mesh status:", status, "source:", source)
		}
		ColorMaterial { id: wireMaterial0; color: "#232323" }
		Transform { id: t0w; rotation: transform0.rotation }
		components: [arm0WireMesh, wireMaterial0, t0w]

		Component.onCompleted: {
			console.log("ARM0 Wire Entity created, components:", arm0Wire.components.length)
		}
	}


	// ------------------ ARM 1 ------------------
	Entity {
		id: arm1
		Mesh {
			id: arm1Mesh
			source: "file:objects/excavator_arm1.obj"
			onStatusChanged: console.log("ARM1 Mesh status:", status, "source:", source)
		}
		ColorMaterial { id: fillMaterial1; color: "#e7e824" }
		Transform { id: t1; matrix: transform1.matrix }
		components: [arm1Mesh, fillMaterial1, t1]

		Component.onCompleted: {
			console.log("ARM1 Entity created, components:", arm1.components.length)
		}
	}

	Entity {
		id: arm1Wire
		Mesh {
			id: arm1WireMesh
			source: "file:objects/excavator_arm1_wire.obj"
			onStatusChanged: console.log("ARM1 Wire Mesh status:", status, "source:", source)
		}
		ColorMaterial { id: wireMaterial1; color: "#232323" }
		Transform { id: t1w; matrix: transform1.matrix }
		components: [arm1WireMesh, wireMaterial1, t1w]

		Component.onCompleted: {
			console.log("ARM1 Wire Entity created, components:", arm1Wire.components.length)
		}
	}


	// ------------------ BUCKET ------------------
	Entity {
		id: bucket
		Mesh {
			id: bucketMesh
			source: "file:objects/excavator_bucket.obj"
			onStatusChanged: console.log("BUCKET Mesh status:", status, "source:", source)
		}
		ColorMaterial { id: fillMaterial2; color: "#e7e824" }
		Transform { id: t2; matrix: transform2.matrix }
		components: [bucketMesh, fillMaterial2, t2]

		Component.onCompleted: {
			console.log("BUCKET Entity created, components:", bucket.components.length)
		}
	}

	Entity {
		id: bucketWire
		Mesh {
			id: bucketWireMesh
			source: "file:objects/excavator_bucket_wire.obj"
			onStatusChanged: console.log("BUCKET Wire Mesh status:", status, "source:", source)
		}
		ColorMaterial { id: wireMaterial2; color: "#232323" }
		Transform { id: t2w; matrix: transform2.matrix }
		components: [bucketWireMesh, wireMaterial2, t2w]

		Component.onCompleted: {
			console.log("BUCKET Wire Entity created, components:", bucketWire.components.length)
		}
	}


	// ------------------ ANIMATIONS ------------------

	QQ2.SequentialAnimation {
		running: true
		loops: QQ2.Animation.Infinite

		QQ2.PauseAnimation { duration: 2000 }

		QQ2.NumberAnimation {
			target: root
			property: "angle0"
			from: -60; to: 0
			duration: 3000
			easing.type: QQ2.Easing.InOutQuad
		}

		QQ2.PauseAnimation { duration: 1000 }

		QQ2.NumberAnimation {
			target: root
			property: "angle0"
			from: 0; to: -60
			duration: 3000
			easing.type: QQ2.Easing.InOutQuad
		}

		QQ2.PauseAnimation { duration: 1000 }
	}


	QQ2.SequentialAnimation {
		running: true
		loops: QQ2.Animation.Infinite

		QQ2.PauseAnimation { duration: 2000 }

		QQ2.NumberAnimation {
			target: root
			property: "angle1"
			from: 90; to: 0
			duration: 3000
			easing.type: QQ2.Easing.InOutQuad
		}

		QQ2.PauseAnimation { duration: 1000 }

		QQ2.NumberAnimation {
			target: root
			property: "angle1"
			from: 0; to: 90
			duration: 3000
			easing.type: QQ2.Easing.InOutQuad
		}

		QQ2.PauseAnimation { duration: 1000 }
	}


	QQ2.SequentialAnimation {
		running: true
		loops: QQ2.Animation.Infinite

		QQ2.PauseAnimation { duration: 3000 }

		QQ2.NumberAnimation {
			target: root
			property: "angle2"
			from: 90; to: 0
			duration: 2000
			easing.type: QQ2.Easing.InOutQuad
		}

		QQ2.NumberAnimation {
			target: root
			property: "angle2"
			from: 0; to: 90
			duration: 3000
			easing.type: QQ2.Easing.InOutQuad
		}

		QQ2.PauseAnimation { duration: 2000 }
	}


	// POS BEHAVIOR
	QQ2.Behavior on pos {
		QQ2.NumberAnimation {
			duration: 1000
			easing.type: QQ2.Easing.InOutQuad
		}
	}

	QQ2.Timer {
		running: true
		interval: 10000
		repeat: true
		onTriggered: root.pos += (Math.random() - 0.5) * 180
	}
}
