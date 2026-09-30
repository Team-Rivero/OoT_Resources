#version 330

uniform sampler2D In;
uniform sampler2D Mask;

in vec2 texCoord;

out vec4 fragColor;

void main() {
    vec4 color = texture(In, texCoord);
    float mask = texture(Mask, texCoord).a;

    float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));

    fragColor = vec4(
        mix(color.rgb, vec3(gray), mask),
        color.a
    );
}