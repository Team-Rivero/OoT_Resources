#version 330

uniform sampler2D InSampler;

in vec2 texCoord;

layout(location = 0) out vec4 fragColor;

void main() {
    vec4 color = texture(InSampler, texCoord);

    float gray = dot(
        color.rgb,
        vec3(0.299, 0.587, 0.114)
    );

    fragColor = vec4(
        gray,
        gray,
        gray,
        color.a
    );
}
