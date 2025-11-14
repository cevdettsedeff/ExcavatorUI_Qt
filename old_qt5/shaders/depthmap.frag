#version 330 core

in vec2 texCoord;
in vec3 modelPos;

out vec4 fragColor;

uniform sampler2D texture;
uniform sampler2D colormap;
uniform float radius;
uniform float rotation;

const float dd = 1.732 / 3.0;

void main()
{
	if (length(modelPos) < radius) {
		float data = length(texture(texture, texCoord).rgb);
		float dxn = length(texture(texture, texCoord + 1e-3 * vec2(-cos(rotation), -sin(rotation))).rgb);
		float dxp = length(texture(texture, texCoord + 1e-3 * vec2(cos(rotation), -sin(rotation))).rgb);
		float dyn = length(texture(texture, texCoord + 1e-3 * vec2(sin(rotation), -cos(rotation))).rgb);
		float dyp = length(texture(texture, texCoord + 1e-3 * vec2(-sin(rotation), cos(rotation))).rgb);
		vec3 color = texture(colormap, vec2(data / 1.732, 0.0)).rgb;

		float d = dxp - dxn - dyp + dyn;
		if (d > 0.0)
			d = dd / (d + dd * dd / d);
		else
			d = atan(d / dd);
		d = 1.0 + clamp(d * dd * 20.0, -0.5, 0.5);

		fragColor = vec4(color * d, 1.0);
	} else discard;
}
