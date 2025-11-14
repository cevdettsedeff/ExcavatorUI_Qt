import Qt3D.Core
import Qt3D.Render

Camera {
	projectionType: CameraLens.OrthographicProjection
	left: -1.0
	right: 1.0
	bottom: -1.0
	top: 1.0
	nearPlane: 0.1
	farPlane: 10.0
	position: Qt.vector3d(0, 0, 1)
	viewCenter: Qt.vector3d(0, 0 ,0)
}

