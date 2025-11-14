#version 330 core

in vec2 viewPos;
in vec3 modelPos;

out vec4 fragColor;

uniform mat4 mvp;
uniform vec2 rsv;
uniform float radius;
uniform float hlw1;
uniform vec3 color;

void main()
{
	vec4 rp4 = mvp * vec4(normalize(modelPos) * radius, 1.0);
	vec2 dis2 = vec2(viewPos - rp4.xy) * rsv;

	fragColor = vec4(color, 1.0) * clamp(hlw1 - length(dis2), 0.0, 1.0);

	if (fragColor.a == 0.0) discard;
}
