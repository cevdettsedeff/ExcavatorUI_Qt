#version 330 core

in vec2 viewPos;
in vec3 modelPos;

out vec4 fragColor;

uniform mat4 modelViewProjection;
uniform vec2 rsv;
uniform float radius;
uniform float hlw1;
uniform vec3 color;

void main()
{
	vec2 vp0 = vec2(modelViewProjection[3][0], modelViewProjection[3][1]);
	vec4 rp4 = modelViewProjection * vec4(normalize(modelPos) * radius, 1.0);
	vec2 dis2 = vec2(viewPos - rp4.xy) * rsv;

	if (viewPos.y > vp0.y)
		fragColor = vec4(color, 1.0) * clamp(hlw1 - length(dis2), 0.0, 1.0);
	else
		fragColor = vec4(0.0);

	if (fragColor.a == 0.0) discard;
}
