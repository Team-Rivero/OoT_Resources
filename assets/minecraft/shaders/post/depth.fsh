#version 150

uniform sampler2D MainSampler;
uniform sampler2D MainDepthSampler;

in vec2 texCoord;

uniform vec2 InSize;

out vec4 fragColor;

const float near = 0.1;
const float far  = 1000.0;

const float fogStart = 4.0;
const float fogFalloff = 0.310714250748;

float LinearizeDepth(float depth) {
    float z = depth * 2.0 - 1.0;
    return (near * far) / (far + near - z * (far - near));
}

void main() {
    float x = LinearizeDepth(texture2D(MainDepthSampler, texCoord).r) + length(InSize / 2 - texCoord ) * 2;
    float y = clamp(1.0 - exp(fogFalloff * (fogStart - x)), 0.0, 1.0);

    // fragColor = vec4(1.0, 1.0, 0.7, 1.0);
    fragColor = vec4(mix(texture2D(MainSampler, texCoord).rgb, vec3(1.0, 1.0, 0.7), y), 1.0);
}