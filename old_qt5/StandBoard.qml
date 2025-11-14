import QtQuick as QQ2

import Qt3D.Core
import Qt3D.Render
import Qt3D.Extras

Entity {
	id: root

	property alias color: material.color
	property Transform transform

	PlaneMesh {
		id: mesh
	}

	ColorFrameMaterial {
		id: material
		color: "#009edb"
		linewidth: Qt.vector4d(.12, .04, .12, .04).times(1.5)
	}


	components: [mesh, material, transform]
}
