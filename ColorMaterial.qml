import Qt3D.Core
import Qt3D.Render

Material {
	id: material

	property color color: "yellow"

	parameters: [
		Parameter {
			name: "color"
			value: Qt.vector3d(material.color.r, material.color.g, material.color.b)
		}
	]

	effect: Effect {
		FilterKey {
			id: forward
			name: "renderingStyle"
			value: "forward"
		}

		techniques: Technique {
			filterKeys: forward
			renderPasses: RenderPass {
				filterKeys: [
					FilterKey { name: "pass"; value: "color" }
				]
				renderStates: CullFace { mode: CullFace.NoCulling }
				shaderProgram: ShaderProgram {
					vertexShaderCode: loadSource("file:shaders/passthrough.vert")
					fragmentShaderCode: loadSource("file:shaders/passthrough_color.frag")
				}
			}
		}
	}
}

