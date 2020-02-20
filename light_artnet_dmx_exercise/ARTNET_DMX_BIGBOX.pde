class ArtNetDmxBox {
  
  // TODO: 
  boolean activeSelf = false;
  
  // private
  int dataLength = 6;
  byte[] dataBuffer = new byte[6];
  
  int channelIndex;
  
  color lightColor = 0x000000;
  boolean enable = true;
  boolean blink;
  
  ArtNetDmxBox() {}
  
  ArtNetDmxBox(int ch_idx) {
    activeSelf = true;
    
    channelIndex = ch_idx;
  }
  
  void ChangeChannelIndex(int i){
    channelIndex = i;
  }
  
  void ChangeColor(color c) {
    lightColor = c;
  }
  
  void ShouldBlink(boolean b) {
    blink = b;
  }
  
  // seperate thread. add log.
  void Update() {
    if(enable)
      dataBuffer[0] = (byte) 0xff;
    else
      dataBuffer[0] = (byte) 0x00;
    
    dataBuffer[1] = byte((lightColor >> 16) & 0xff);
    dataBuffer[2] = byte((lightColor >> 8) & 0xff);
    dataBuffer[3] = byte(lightColor & 0xff);
    
    if(blink)
      dataBuffer[4] = (byte) 0xff;
    else
      dataBuffer[4] = (byte) 0x00;
    
    dataBuffer[5] = 0x00;
  }
}
