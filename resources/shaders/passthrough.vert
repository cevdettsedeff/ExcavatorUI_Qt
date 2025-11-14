#version 330 core

in vec3 vertexPosition;
in vec2 vertexTexCoord;

out vec2 texCoord;

uniform mat4 modelViewProjection;

void main()
{
	texCoord = vertexTexCoord;
	gl_Position = modelViewProjection * vec4(vertexPosition, 1.0);
}
