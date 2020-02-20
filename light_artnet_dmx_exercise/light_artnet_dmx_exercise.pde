import java.util.Arrays.*;
import ch.bildspur.artnet.*;

ArtNetClient artnet;
byte[] dmxData = new byte[512];

int BOXAMOUNT = 2;
ArtNetDmxBox[] artNetDmxBoxes = new ArtNetDmxBox[BOXAMOUNT];
UI_ColorPicker[] ui_colorPicker = new UI_ColorPicker[BOXAMOUNT];

// TODO: conflict detection
/*
int currentIndex;
boolean[] dmxTable = new boolean[512];
// if buggy then try: if no owner transmit zero 
*/

void setup() {
  size(800, 400);
  background(0);
  
  artnet = new ArtNetClient(null);
  artnet.start();
  
  // DATA_Init() ?
  int cur_channelIndex = 0;
  for(int i=0; i<BOXAMOUNT; i++) {
    artNetDmxBoxes[i] = new ArtNetDmxBox(cur_channelIndex + 1);
    cur_channelIndex += artNetDmxBoxes[i].dataLength;
    
    ui_colorPicker[i] = new UI_ColorPicker(200 + 400 * i, 200, 330, i);
  }
  
  timer_artNetTransmit.scheduleAtFixedRate(task_artNetTransmit, 1000, 33); // 15 
}

void draw() {  
  for(int i=0; i<BOXAMOUNT; i++) {
    ui_colorPicker[i].Update();
    artNetDmxBoxes[i].Update();
  }
}

void _TransmitData() {
  for(int i=0; i<BOXAMOUNT; i++)
    System.arraycopy(artNetDmxBoxes[i].dataBuffer, 0, dmxData, artNetDmxBoxes[i].channelIndex - 1, artNetDmxBoxes[i].dataLength);
  
  // send dmx to localhost
  artnet.unicastDmx("192.168.1.220", 0, 0, dmxData);
  
  // Debug log
  println("DmxData: " + javax.xml.bind.DatatypeConverter.printHexBinary(dmxData));
  println("ArtNetDmxData: [0-5]: " + javax.xml.bind.DatatypeConverter.printHexBinary(artNetDmxBoxes[0].dataBuffer) + " ,[6-11]: " + javax.xml.bind.DatatypeConverter.printHexBinary(artNetDmxBoxes[1].dataBuffer));
}

void SetColor(int idx, color c) {
  // should use function call?
  artNetDmxBoxes[idx].lightColor = c;
}

void SetBlink(int idx, boolean b) {
  artNetDmxBoxes[idx].blink = b;
}

void Enable(int idx, boolean b) {
  artNetDmxBoxes[idx].enable = b;
}
