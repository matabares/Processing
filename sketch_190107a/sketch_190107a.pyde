def setup():
    size(500, 500)
    colorMode(HSB)
    noStroke()


def draw():
    fill(0x11000000)
    rect(0, 0, width, height)
    fill(frameCount % 255, 255, 255)
    ellipse(mouseX, mouseY, 20, 20)
