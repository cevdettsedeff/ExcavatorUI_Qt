import QtQuick as QQ2

import Qt3D.Core
import Qt3D.Render
import Qt3D.Extras

Entity {
	id: root

	CloseModelingCamera {
		id: camera
	}

	RenderSettings3 {
		camera: camera
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

	Excavator {
		id: machine1
		radius: root.radius
		y: height - iHeight + bHeight / 2
		scale: 0.03
		customX: .86 * root.radius
		customZ: 0
		pos: 0  // Fixed position, no rotation
	}

	StandBoard {
		components: [
			Transform {
				scale3D: Qt.vector3d(.08 * radius, 1., bHeight)
				translation: Qt.vector3d(.86 * root.radius, height - iHeight + bHeight / 2, 0)
				rotationX: 90
			}
		]
	}

	Circle {
		linewidth: lw
		radius: root.radius
	}

	MinePlane {
		id: mine
		radius: root.radius * cRatio
		rotation: -root.pos
		components: [
			Transform {
				rotationY: -root.pos
				translation: Qt.vector3d(0, -6e-2, 0)
			}
		]
	}

	Line {
		linewidth: lw
		components: [
			Transform {
				rotationX: 90
				translation: Qt.vector3d(radius, height / 2, 0)
				scale3D: Qt.vector3d(1, 1, height)
			}
		]
	}

	Line {
		linewidth: lw
		components: [
			Transform {
				rotationX: 90
				translation: Qt.vector3d(radius * iRatio, height - iHeight / 2, 0)
				scale3D: Qt.vector3d(1, 1, iHeight)
			}
		]
	}

	/*
	Circle {
		linewidth: lw
		radius: root.radius * iRatio
		components: [
			Transform {
				translation: Qt.vector3d(0, height - iHeight, 0)
			}
		]
	}

	HalfCircle {
		linewidth: lw
		radius: root.radius * iRatio
		components: [
			Transform {
				translation: Qt.vector3d(0, height - iHeight + bHeight / 2, 0)
			}
		]
	}
	*/
}
