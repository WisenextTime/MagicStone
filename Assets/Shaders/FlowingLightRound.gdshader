shader_type canvas_item;

uniform sampler2D Gradient;
uniform float TimeScale:hint_range(0.0, 1.0);

void vertex() {
	// Called for every vertex the material is visible on.
	UV = VERTEX;
}

void fragment() {
	float current = .5 - atan(UV.x,UV.y)/TAU;
	float target = mod(TIME*TimeScale,1.);
	
	float map = mod(current+1.-target,1.);
	
	COLOR *= texture(Gradient,vec2(map,0));
	//COLOR.a *= current<mod(TIME*TimeScale,1.) ? 1.:0.;
}
