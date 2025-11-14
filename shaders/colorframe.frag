#version 330 core

in vec2 texCoord;
in vec2 viewPos;
in vec3 modelPos;

out vec4 fragColor;

uniform vec4 linewidth;
uniform vec3 color;
uniform vec3 linecolor;

void main()
{
	vec4 border = linewidth;
	bool f = texCoord.x < border.x ||
			texCoord.y < border.y ||
			texCoord.x + border.z > 1.0 ||
			texCoord.y + border.w > 1.0;
	fragColor = f ? vec4(linecolor, 1.0) : vec4(color, 1.0);
}
