#version 110

uniform sampler2D DiffuseSampler;
uniform sampler2D DiffuseDepthSampler;

varying vec2 texCoord;
varying vec2 oneTexel;

float near = 0.1; 
float far  = 1000.0; 

float LinearizeDepth(float depth) {
    float z = depth * 2.0 - 1.0;
    return (near * far) / (far + near - z * (far - near));    
}

void main() {
    float x = LinearizeDepth(texture2D(DiffuseDepthSampler, texCoord).r);
    float c = 4.0;
    float b = 0.999999887465;
    float h = 0.310714250748;
    float y; y = (1.0 - exp(h*(c - x)))/b;
    gl_FragColor = vec4(1.0, 1.0, 0.0, y);
    gl_FragColor.b = 0.7;
}