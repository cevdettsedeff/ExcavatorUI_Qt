import Qt3D.Core
import Qt3D.Render

Camera {
	projectionType: CameraLens.OrthographicProjection
	left: -1.5
	right: 1.5
	bottom: -1.0
	top: 1.0
	nearPlane: 0.1
	farPlane: 10.0
	position: Qt.vector3d(0.6, 0.5, 1)
	viewCenter: Qt.vector3d(0.6, 0 ,0)
}

