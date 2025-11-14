import Qt3D.Core
import Qt3D.Render

Camera {
	projectionType: CameraLens.OrthographicProjection
	position: Qt.vector3d(0.6, 0.5, 1)
	viewCenter: Qt.vector3d(0.6, 0 ,0)
}

