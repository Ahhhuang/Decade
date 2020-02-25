Thought:
  1. Create a "slide" of a function, and move it toward the origin point by T(cycle).
    
    - ff3_func_T: Cycle Time.
    - ff3_func_origin: Start point of the slided-function.
    - ff3_func_range: Range of the slided-function.
  
  2. Duplicate the slided-function to a new infinite function, and map the led to a particular range.
    
    - ff3_funcs_lednum: The amount of LEDs. 
    - ff3_funcs_coverrange: The particular range.
    
  Notice: What I try to duplicate the slided-function, is always % the range of my slided function. Thus, the point f(x) will have the same value as f(x + range)
  
  3. Calculate the offset depends on the time and the LED index.
  
    - offset = (t_offset + idx_offset) % range, like above "Notice".
  
    - t_offset: Offset depends on Time 
      => p = (current time % cycle time) / cycle time, is the percentage in the whole cycle time.
      => t_offset = p * range, is the offset of the slided function depends on time.
      
    - idx_offset: Offset depends on LED Index
      => (idx / length of LED) * cover range, is the offset of the duplicated-function(the infinte function) depends on index mapping.
