shader_type canvas_item;

#include "ShaderTools.gdshaderinc"

//args for gaussian blur:
uniform float Strenth:hint_range(0.0, 3.0);//高斯模糊强度
uniform float Range:hint_range(0.0, 5.0);//高斯模糊范围
uniform int Step;//采样步数

uniform float Glow:hint_range(0.0, 10.0);
uniform float Subtraction:hint_range(0.0, 0.2);

void fragment() {
	//gaussian blur
	float weight_sum;
	vec4 color = vec4(0,0,0,1);
	for(int i=-Step; i<=Step; i++){
		for(int j=-Step; j<=Step; j++){
			float x = float(i)*Range;
			float y = float(j)*Range;
			float weight = gaussian2(x,y,Strenth);
			color += SCREEN_COLOR_SHIFT(x,y) * weight;
			weight_sum += weight;
		}
	}
	color /= weight_sum;
	color *= Glow;
	color.r=max(0.,color.r-Subtraction);
	color.g=max(0.,color.g-Subtraction);
	color.b=max(0.,color.b-Subtraction);

	COLOR.rgb = color.rgb + SCREEN_COLOR_CURRENT.rgb;
}