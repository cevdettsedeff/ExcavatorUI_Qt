import Qt3D.Core
import Qt3D.Render

Material {
	id: material

	property color color: "yellow"

	effect: Effect {

		FilterKey {
			id: forward
			name: "renderingStyle"
			value: "forward"
		}

		techniques:
			Technique {
				renderPasses: RenderPass {
					filterKeys: [
						FilterKey { name: "pass"; value: "color" },
						FilterKey { name: "pass"; value: "color&surface" }
					]
					renderStates: CullFace { mode: CullFace.NoCulling }
					shaderProgram: ShaderProgram {
						vertexShaderCode: loadSource("file:shaders/passthrough.vert")
						fragmentShaderCode: loadSource("file:shaders/passthrough_color.frag")
					}
				}

				parameters: [
					Parameter {
						name: "color"
						value: material.color
					}
				]
		}
	}
}

