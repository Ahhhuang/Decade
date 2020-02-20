class UI_ColorPicker {
  
  PVector center;
  
  int index;
  float radius = 0f;
  float triggerRadius = 0f;
  color c = color(255);
  
  boolean mouseEnable = false;
  
  UI_ColorPicker(int x, int y, float r, int idx) {
    center = new PVector(x, y);
    radius = r;
    triggerRadius = r + 10;
    index = idx;
  }

  void Update() {
    float dist = abs(new PVector(mouseX, mouseY).dist(center));
    
    if(!mouseEnable && mousePressed && (mouseButton == LEFT) && dist <= triggerRadius / 2)
      mouseEnable = true;
    
    if(mouseEnable && !mousePressed)
      mouseEnable = false;

    if(mouseEnable && dist <= triggerRadius / 2) {
      int brightness = constrain(int(map(dist, 0, radius / 2, 0, 255)), 0, 255);
      c = color(brightness);
      //println("dist: " + dist + " brightness: " + brightness);
    }
    
    noStroke();
    fill(c);
    circle(center.x, center.y, radius);
    
    // set color
    SetColor(index, c);
  }
}
// motion design
// music design top Emotional Empath

// UDP server
