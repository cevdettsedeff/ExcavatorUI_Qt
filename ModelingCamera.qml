import Qt3D.Core
import Qt3D.Render

Camera {
	projectionType: CameraLens.OrthographicProjection
	position: Qt.vector3d(0, .75, 1)
	viewCenter: Qt.vector3d(0, .33 ,0)
}

