import Qt3D.Core
import Qt3D.Render

Camera {
	projectionType: CameraLens.OrthographicProjection
	left: -1.2
	right: 1.2
	bottom: -0.8
	top: 1.2
	nearPlane: 0.1
	farPlane: 10.0
	position: Qt.vector3d(0, .75, 1)
	viewCenter: Qt.vector3d(0, .33 ,0)
}

