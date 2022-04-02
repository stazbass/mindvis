import de.looksgood.ani.*;

int meditation = 0;
int maxMeditation = 100;
int poorSignal = 0;
int attention = 0;

void drawVis(float dt, JSONObject message){
  if(message != null){
    setMeditation(message.getInt("meditation"));
    setPoorSignal(message.getInt("poorSignal"));
    setAttention(message.getInt("attention"));
    int maxSize = height;
    if(poorSignal < 10) { fill(0, 244, 0);}else{fill(255, 0, 0);};
    circle(width/2,height/2,maxSize*maxMeditation/maxMeditation);
    fill(255, 255, 255);
    circle(width/2,height/2,maxSize*meditation/100.0);
    
        
    textAlign(CENTER);
    fill(0);
    text(meditation, width/2, height/2);
  }
}

void setMeditation(int val){
  Ani.to(this,  2.5, "meditation", val);
}

void setPoorSignal(int val){
  Ani.to(this,  0.5, "poorSignal", val);
}
void setAttention(int val){
  Ani.to(this,  0.5, "attention", val);
}
