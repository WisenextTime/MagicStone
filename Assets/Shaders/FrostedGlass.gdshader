shader_type canvas_item;

//噪点颜色和强度是原本颜色的色值和alpha

#include "res://Assets/Shaders/ShaderTools.gdshaderinc"
#define SCREEN_COLOR(x,y) texture(SCREEN_TEXTURE, SCREEN_UV+vec2((x),(y))*SCREEN_PIXEL_SIZE)

uniform sampler2D SCREEN_TEXTURE: hint_screen_texture,filter_linear;

//args for gaussian blur:
uniform float Strenth:hint_range(0.0, 3.0);//高斯模糊强度
uniform float Range:hint_range(0.0, 2.0);//高斯模糊范围
uniform int Step;//采样步数

void fragment() {
	//gaussian blur
	float weight_sum;
	vec4 color = vec4(0);
	for(int i=-Step; i<=Step; i++){
		for(int j=-Step; j<=Step; j++){
			float x = float(i)*Range;
			float y = float(j)*Range;
			float weight = gaussian2(x,y,Strenth);
			color += SCREEN_COLOR(x,y) * weight;
			weight_sum += weight;
		}
	}
	color /= weight_sum;
	
	//noise
	vec3 noise_color = COLOR.rgb;
	float noise_strength = COLOR.a;
	float noise = noise(UV) * noise_strength/50.;
	color.rgb += noise_color * noise;
	
	COLOR = vec4(color.rgb,1.);
}
