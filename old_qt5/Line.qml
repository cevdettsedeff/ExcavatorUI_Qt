import Qt3D.Core
import Qt3D.Render
import Qt3D.Extras

Entity {
	id: root

	property real linewidth: 2.
	property alias color: material.color
	property Transform transform

	PlaneMesh {
		id: mesh
		height: 1.
		width: root.linewidth/app.sceneWidth
		meshResolution: Qt.size(2, 2)
//			primitiveType: GeometryRenderer.LineLoop
	}

	ColorMaterial {
		id:material
		color: "#232323"
	}


	components: [mesh, material, transform]
}
