float gaussian(float x, float sigma) {
    return (1.0 / (sigma * sqrt(2.0 * 3.14159265))) * exp(-(x * x) / (2.0 * sigma * sigma));
}

float gaussian2(float x, float y, float sigma) {
    return (1.0 / (2.0 * 3.14159265 * sigma * sigma)) * exp(-((x * x + y * y) / (2.0 * sigma * sigma)));
}

float noise(vec2 uv) {
    return fract(sin(dot(uv.xy * 100.0, vec2(12.9898, 78.233))) * 43758.5453);
}
