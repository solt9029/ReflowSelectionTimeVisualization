import controlP5.*;
import de.bezier.data.sql.*;

SQLite db;
ControlP5 cp5;

void setup() {
  size(1500,700);

  PFont font = createFont("arial",20);
  textFont(font);

  background(30);
  drawMenuText();

  //DBの初期化
  db=new SQLite(this,"reflow.db");
  if(!db.connect()){
    exit();
  }

  // ControlP5の初期化
  cp5 = new ControlP5(this);
  
  //フォーム系の描画をする
  cp5.addTextfield("min").setPosition(1100,50).setSize(350,40).setFont(font).setFocus(true).setColor(color(255));
  cp5.addTextfield("max").setPosition(1100,130).setSize(350,40).setFont(font).setColor(color(255));
  cp5.addBang("WindowSize_340_1330").setPosition(1100,270).setSize(350,40).setFont(font).getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);    
  cp5.addBang("WindowSize_450_1000").setPosition(1100,330).setSize(350,40).setFont(font).getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);  
  cp5.addBang("WindowSize_560_890").setPosition(1100,390).setSize(350,40).setFont(font).getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);  
  cp5.addBang("WindowSize_670_670").setPosition(1100,450).setSize(350,40).setFont(font).getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);  
  cp5.addBang("WindowSize_780_670").setPosition(1100,510).setSize(350,40).setFont(font).getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);  
  cp5.addBang("WindowSize_890_560").setPosition(1100,570).setSize(350,40).setFont(font).getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);  
  cp5.addBang("WindowSize_1990_230").setPosition(1100,630).setSize(350,40).setFont(font).getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);  

  draw340_1330();
}

void draw() {
  //text(cp5.get(Textfield.class,"min").getText(), 360,130);
  //text(cp5.get(Textfield.class,"max").getText(), 360,180);
}

public void WindowSize_340_1330(){
  background(30);
  drawMenuText();
  draw340_1330();
}

public void WindowSize_450_1000(){
  background(30);
  drawMenuText();
  draw450_1000();
}

public void WindowSize_560_890(){
  background(30);
  drawMenuText();
  draw560_890();
}

public void WindowSize_670_670(){
  background(30);
  drawMenuText();
  draw670_670();
}

public void WindowSize_780_670(){
  background(30);
  drawMenuText();
  draw780_670();
}

public void WindowSize_890_560(){
  background(30);
  drawMenuText();
  draw890_560();
}

public void WindowSize_1990_230(){
  background(30);
  drawMenuText();
  draw1990_230();
}

public void drawMatrix(int wi, int he, float [] array){
  int len=50;
  for(int h=0; h<he; h++){
    for(int w=0; w<wi; w++){
      if(h*wi+w<36){
        float min=float(cp5.get(Textfield.class,"min").getText());
        float max=float(cp5.get(Textfield.class,"max").getText());
        
        if(array[h*wi+w]<min || array[h*wi+w]>max){
          stroke(0);
          fill(70);
          rect(w*len+len,h*len+len,len,len);
        }else{
          stroke(0);
          fill(255);
          rect(w*len+len,h*len+len,len,len);
          textAlign(CENTER,CENTER);
          fill(0);
          text(str((int)array[h*wi+w]),w*len+len+len/2,h*len+len+len/2);
        }
      }
    }
  }
}

public void draw450_1000(){
  int wi=4;
  int he=9;
  float [] array=new float [36];
  for(int i=0; i<array.length; i++){
    array[i]=getAverageTimeByPositionAndSize(i+1,450,1000);
  }
  drawMatrix(wi,he,array);
}

public void draw560_890(){
  int wi=5;
  int he=8;
  float [] array=new float [36];
  for(int i=0; i<array.length; i++){
    array[i]=getAverageTimeByPositionAndSize(i+1,560,890);
  }
  drawMatrix(wi,he,array);
}

public void draw340_1330(){
  int wi=3;
  int he=12;
  float [] array=new float [36];
  for(int i=0; i<array.length; i++){
    array[i]=getAverageTimeByPositionAndSize(i+1,340,1330);
  }
  drawMatrix(wi,he,array);
}

public void draw1990_230(){
  int wi=18;
  int he=2;
  float [] array=new float [36];
  for(int i=0; i<array.length; i++){
    array[i]=getAverageTimeByPositionAndSize(i+1,1990,230);
  }
  drawMatrix(wi,he,array);
}

public void draw890_560(){
  int wi=8;
  int he=5;
  float [] array=new float [36];
  for(int i=0; i<array.length; i++){
    array[i]=getAverageTimeByPositionAndSize(i+1,890,560);
  }
  drawMatrix(wi,he,array);
}

public void draw780_670(){
  int wi=7;
  int he=6;
  float [] array=new float [36];
  for(int i=0; i<array.length; i++){
    array[i]=getAverageTimeByPositionAndSize(i+1,780,670);
  }
  drawMatrix(wi,he,array);
}

public void draw670_670(){
  int wi=6;
  int he=6;
  float [] array=new float [36];
  for(int i=0; i<array.length; i++){
    array[i]=getAverageTimeByPositionAndSize(i+1,670,670);
  }
  drawMatrix(wi,he,array);
}

//メニュー部分のテキストを描画する
public void drawMenuText(){
  fill(255);
  textAlign(LEFT,CENTER);
  text("# Selection Time (milliseconds)",1100,30);
  text("# Window Size (pixels)",1100,250);
}

public float getAverageTimeByPositionAndSize(int p, int w, int h){
  String stmt="select avg(time) from selection_times where position="+p+" and width="+w+" and height="+h;
  db.query(stmt);
  while(db.next()){
    return db.getFloat("avg(time)");
  }
  return float(0);
}

public float getAverageTimeByPosition(int p){
  String stmt="select avg(time) from selection_times where position="+p;
  db.query(stmt);
  while(db.next()){
    return db.getFloat("avg(time)");
  }
  return float(0);
}

public float getAverageTimeBySize(int w, int h){
  String stmt="select avg(time) from selection_times where width="+w+" and height="+h;
  db.query(stmt);
  while(db.next()){
    return db.getFloat("avg(time)");
  }
  return float(0);
}

public float getAverageTime(){
  String stmt="select avg(time) from selection_times";
  db.query(stmt);
  while(db.next()){
    return db.getFloat("avg(time)");
  }
  return float(0);
}