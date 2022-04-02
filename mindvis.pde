import websockets.*;
import de.looksgood.ani.*;

WebsocketClient wsc;
int now;
boolean newEllipse;
JSONObject recentMessage = null;
long lastTime;

void setup() {
  size(1024, 768);

  newEllipse=true;
  Ani.init(this);
  Ani.setDefaultEasing(Ani.EXPO_OUT);
  wsc= new WebsocketClient(this, "ws://localhost:8025/mind");
  lastTime = now=millis();
}

void draw() {
  long time = millis();
  drawVis((time-lastTime)/1000.0, recentMessage);
}

void webSocketEvent(String msg) {
  println("Got message");
  println(msg);
  JSONObject  message = parseJSONObject(msg);
  recentMessage = message;
  println(message);
  newEllipse=true;
}
