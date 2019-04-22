shader_type canvas_item;

uniform float factor : hint_range(0, 1) = 0;

void fragment() {
    vec4 tex = texture(TEXTURE, UV);
	vec4 col = tex;
	if (0.1 < col.a){
		//lazy man's hue shift
		col.r += (tex.g + tex.b) * factor * 1.3;
		col.gb *= 1.0 - factor;
		//make it white
		col.rbg += vec3(1.0,1.0,1.0) * (max(0.0, factor - 0.5)) * 2.0;
	}else{
		col = vec4(0,0,0,0);
	}
    COLOR = col;
}void vertex() {
	float shake = TIME * 32.0;
	VERTEX += VERTEX * vec2(sin(shake), cos(shake)) * 0.2 * factor;
}