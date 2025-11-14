import QtQuick as QQ2

import Qt3D.Core
import Qt3D.Render
import Qt3D.Extras

Entity {
	id: root

	QQ2.Component.onCompleted: {
		console.log("=== SIDE SCENE DEBUG ===")
		console.log("SideScene created")
		console.log("  radius:", radius)
		console.log("  height:", height)
		console.log("  Camera position:", camera.position)
		console.log("  Camera viewCenter:", camera.viewCenter)
		console.log("  Camera left:", camera.left, "right:", camera.right)
		console.log("  Camera bottom:", camera.bottom, "top:", camera.top)
		console.log("  Camera nearPlane:", camera.nearPlane, "farPlane:", camera.farPlane)
	}

	SideModelingCamera {
		id: camera
	}

	RenderSettings3 {
		camera: camera
	}

	property real cRatio: .96
	property real iRatio: .895
	property real radius: .5 * cRatio
	property real height: .66
	property real iHeight: .6
	property real bHeight: iHeight / 5
	property real lw: 3.
	property real eps: 1e-3

	Excavator {
		id: machine1
		radius: root.radius
		y: 0
		scale: 0.025
		customX: 0.3
		customZ: 0
		pos: 0  // Fixed position, no rotation
	}
}
