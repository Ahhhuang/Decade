float ff3 = 0;

// single func
long ff3_func_T = 500;
float ff3_func_origin = HALF_PI; 
float ff3_func_range = HALF_PI;

// func spread
int ff3_funcs_lednum = 100;
float ff3_funcs_coverrange = PI;

// led count
float led_count=100;

void setup(){
  size(1000,300);
  
}

void draw(){
  background(128);
  
  long t = millis();
  float t_offset = ((float)(t % ff3_func_T) / (float)ff3_func_T) * ff3_func_range;
  for(int i=0;i<led_count;i++){    
    float idx_offset = (float)i / (float)ff3_funcs_lednum * ff3_funcs_coverrange;
    float offset = t_offset + idx_offset;
    int p = floor(offset / ff3_func_range);
    ff3 = sin( (float)(offset - float(p) * ff3_func_range) + ff3_func_origin);
    
    float cc3= 255.0 * ff3;
    fill(cc3);
    ellipse(20+i*8,60,6,6); 
  }
    fill(255);
    text("ff3="+ff3,10,120);
}
