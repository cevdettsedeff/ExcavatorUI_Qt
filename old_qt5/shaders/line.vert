#version 330 core

in vec3 vertexPosition;

out vec2 viewPos;
out vec3 modelPos;

uniform mat4 modelViewProjection;

void main()
{
	modelPos = vertexPosition;
	vec4 vp4 = modelViewProjection * vec4(vertexPosition, 1.0);
	viewPos = vp4.xy;
	gl_Position = modelViewProjection * vec4(vertexPosition, 1.0);
}
