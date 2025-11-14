#version 330 core

in vec3 vertexPosition;
in vec2 vertexTexCoord;

out vec2 texCoord;
out vec3 modelPos;

uniform mat4 modelViewProjection;
uniform sampler2D texture;
uniform float radius;

void main()
{
	texCoord = vertexTexCoord;
	modelPos = vertexPosition;
	modelPos.y += length(texture(texture, texCoord)) * 5e-2;
	gl_Position = modelViewProjection * vec4(modelPos, 1.0);
}
