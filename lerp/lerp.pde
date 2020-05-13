float x;
float y;
float radius;
float targetRadius;

void setup() {
    size(1000, 1000);
    radius = 0;
    targetRadius = 100;
}

void draw() {
    background(0);
    ellipse(x, y, radius, radius);

    x += (mouseX - x) * 0.1;
    y += (mouseY - y) * 0.1;
    radius += (targetRadius - radius) * 0.1;

    if (frameCount % 100 == 0) {
        targetRadius = random(50, 200);
    }
}