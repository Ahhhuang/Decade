import java.util.Timer; 
import java.util.TimerTask; 

Timer timer_artNetTransmit = new Timer();
TimerTask task_artNetTransmit = new java.util.TimerTask() {
  public void run() {
    try {
      _TransmitData();
    }
    catch(Exception e) {
      println(e);
    }
  }
};
