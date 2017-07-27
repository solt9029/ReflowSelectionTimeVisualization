import controlP5.*;

ControlP5 cp5;

void setup() {
  size(1500,700);
  
  PFont font = createFont("arial",20);
  
  cp5 = new ControlP5(this);
  
  cp5.addTextfield("min").setPosition(1100,50).setSize(350,40).setFont(font).setFocus(true).setColor(color(255));
  cp5.addTextfield("max").setPosition(1100,130).setSize(350,40).setFont(font).setColor(color(255));

  cp5.addBang("WindowSize_340_1330").setPosition(1100,270).setSize(350,40).setFont(font).getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);    
  cp5.addBang("WindowSize_450_1000").setPosition(1100,330).setSize(350,40).setFont(font).getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);  
  cp5.addBang("WindowSize_560_890").setPosition(1100,390).setSize(350,40).setFont(font).getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);  
  cp5.addBang("WindowSize_670_670").setPosition(1100,450).setSize(350,40).setFont(font).getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);  
  cp5.addBang("WindowSize_780_670").setPosition(1100,510).setSize(350,40).setFont(font).getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);  
  cp5.addBang("WindowSize_890_560").setPosition(1100,570).setSize(350,40).setFont(font).getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);  
  cp5.addBang("WindowSize_1990_230").setPosition(1100,630).setSize(350,40).setFont(font).getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);  
  textFont(font);
}

void draw() {
  background(30);
  
  fill(255);
  text("# Selection Time (milliseconds)",1100,30);
  text("# Window Size (pixels)",1100,250);
  
  text(cp5.get(Textfield.class,"min").getText(), 360,130);
  text(cp5.get(Textfield.class,"max").getText(), 360,180);
}

public void WindowSize_340_1330(){
  println("test");
}

public void WindowSize_450_1000(){
}

public void WindowSize_560_890(){
}

public void WindowSize_670_670(){
}

public void WindowSize_780_670(){
}

public void WindowSize_890_560(){
}

public void WindowSize_1990_230(){
}