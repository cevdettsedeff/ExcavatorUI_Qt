import Qt3D.Core
import Qt3D.Render

Entity {
	property Camera camera:ModelingCamera {
		id:camera
	}

	RenderSettings1 {
		camera: camera
	}

	Inputs0 {
		id: inputs
		camera: camera
	}

//	inputs.onOnFrameChange: {
////		console.log()
//	}
}

