#version 150

uniform sampler2D MainSampler;
uniform sampler2D MainDepthSampler;

in vec2 texCoord;

out vec4 fragColor;

float near = 0.1;
float far  = 1000.0;

float c = 4.0;
float b = 0.999999887465;
float h = 0.310714250748;

float LinearizeDepth(float depth) {
    float z = depth * 2.0 - 1.0;
    return (near * far) / (far + near - z * (far - near));    
}

void main() {
    float x = LinearizeDepth(texture2D(MainDepthSampler, texCoord).r);
    float y = (1.0 - exp(h*(c - x)))/b;
    fragColor = vec4(1.0, 1.0, 0.7, y);
}