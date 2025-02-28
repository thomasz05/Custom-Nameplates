#version 150
#moj_import <minecraft:fog.glsl>

uniform sampler2D Sampler0;
uniform vec4 ColorModulator;
uniform float FogStart,FogEnd;
uniform vec4 FogColor;
uniform float GameTime;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;
in float depthLevel;
%SHADER_0%
out vec4 fragColor;

void main() {
    vec4 texColor = texture(Sampler0, texCoord0);
    vec4 color = texColor * vertexColor * ColorModulator;%SHADER_1%
    if (color.a < 0.1) {
        discard;
    }
    if (depthLevel == 114514.0) {
        discard;
    }
    if (texColor.a == 254.0/255.0) {
        if (depthLevel == 1000.0
         || depthLevel == 2200
         || depthLevel == 50
         || depthLevel == 2650
         || depthLevel == 200
         || depthLevel == 400
         || depthLevel == 2800
         || depthLevel == 2400
        ) {
            discard;
        } else {
            color = vec4(texColor.rgb, 1.0) * vertexColor * ColorModulator;
        }
    }
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}