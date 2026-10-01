#version 330

uniform sampler2D InSampler;

in vec2 texCoord;

out vec4 fragColor;

void main() {
    float mask = texture(InSampler, texCoord).a;

    fragColor = vec4(mask, mask, mask, mask);
}