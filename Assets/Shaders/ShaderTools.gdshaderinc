//这里是些万恶的宏
#define SCREEN_COLOR_SHIFT(x,y) texture(SCREEN_TEXTURE, SCREEN_UV+vec2((x),(y))*SCREEN_PIXEL_SIZE)
#define SCREEN_COLOR_CURRENT texture(SCREEN_TEXTURE, SCREEN_UV)
uniform sampler2D SCREEN_TEXTURE: hint_screen_texture,filter_linear;

float gaussian(float x, float sigma) {
    return (1.0 / (sigma * sqrt(2.0 * 3.14159265))) * exp(-(x * x) / (2.0 * sigma * sigma));
}

float gaussian2(float x, float y, float sigma) {
    return (1.0 / (2.0 * 3.14159265 * sigma * sigma)) * exp(-((x * x + y * y) / (2.0 * sigma * sigma)));
}

float noise(vec2 uv) {
    return fract(sin(dot(uv.xy * 100.0, vec2(12.9898, 78.233))) * 43758.5453);
}
