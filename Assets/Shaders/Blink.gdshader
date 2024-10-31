shader_type canvas_item;
uniform sampler2D noise_texture;

void fragment()
{
	vec2 offect = vec2(fract(SCREEN_UV.x+TIME/100.0),fract(SCREEN_UV.y+TIME/100.0));
	float deep = texture(noise_texture,offect).r;
	COLOR.rgb*=deep;
}