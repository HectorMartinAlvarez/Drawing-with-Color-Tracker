/*

This example shows a whole lot of different
tracking methods being rendered at one time.
Don't be surprised if this one runs really slowly.

 last tested to work in Processing 0090
 
 JTNIMOY
 
*/

import JMyron.*;
import java.util.List;
import java.util.ArrayList;

List<int[]> figure = new ArrayList<int[]>();
int red = 0;
int green = 0;
int blue = 254;
int tolerance = 240;
boolean drawable = false;
boolean camera = true;
boolean contorno = true;

JMyron m;
 
void setup(){
  int w = 320;
  int h = 240;
  
  size(640,480);
  m = new JMyron();
  m.start(640,480);
  m.findGlobs(1);
  println("Myron " + m.version());
}

void mousePressed(){
  m.settings();
}

void draw(){
  m.trackColor(red,green,blue,tolerance);

  m.update();
  int[] img = m.image();
  
  if(camera){
    loadPixels();
    for(int i=0;i<img.length;i++){
        pixels[i] = img[i];
    }
    updatePixels();
  }else{
   background(255); 
  }
  
  
  strokeWeight(5);
  stroke(0);
  for(int i = 0; i < figure.size()-1; i++){
    line(figure.get(i)[0],figure.get(i)[1],figure.get(i+1)[0],figure.get(i+1)[1]); 
  }
  
  strokeWeight(1);
  stroke(0);
  textSize(20);
  textAlign(LEFT);
  fill(0);
  text("R:"+red+ " G:"+green + " B:"+blue,1,20);
  text("Tol:"+tolerance,1,40);
  text("Draw:"+drawable,1,60);
  textAlign(RIGHT);
  text("Tracking:",width-40,20);
  fill(color(red,green,blue,tolerance));
  rect(width-40,0,40,40);
  fill(0);

  noFill();
  int[][] a;
  int[] draw = {0,height};

  if(camera){
    a = m.globBoxes();
    stroke(255,0,0);
    for(int i=0;i<a.length;i++){
      int[] b = a[i];
      rect(b[0], b[1], b[2], b[3]);
    }
  }

  int list[][][] = m.globPixels();
  
  if(contorno){
   stroke(0,255,0);
    for(int i=0;i<list.length;i++){
      int[][] pixellist = list[i];
      if(pixellist!=null){
        beginShape(POINTS);
        for(int j=0;j<pixellist.length;j++){    
          vertex( pixellist[j][0]  ,  pixellist[j][1] );
        }
        endShape();
       }
    } 
  }
  
  list = m.globEdgePoints(20);
  stroke(0,128,0);
  for(int i=0;i<list.length;i++){
    int[][] contour = list[i];
    if(contour!=null){
      beginShape(LINE_LOOP);
      for(int j=0;j<contour.length;j++){
        if(draw[1] > contour[j][1]){
           draw[0] = contour[j][0];
           draw[1] = contour[j][1];
        }
      }
      endShape();
     }
  }
  fill(color(255,0,0));
  stroke(255);
  triangle(draw[0]-10,draw[1]+20,draw[0],draw[1],draw[0]+10,draw[1]+20);
  noFill();
  if(drawable){
    if(draw[1] < height-5 && draw[0] > 5){
      figure.add(draw);
    }
  }
}

public void stop(){
  m.stop();
  super.stop();
}

void keyPressed(){
  switch(key){
    case 'c':
    case 'C':
      figure.clear(); 
      break;
    case 'q':
    case 'Q':
      tolerance+=2;
      break;
    case 'a':
    case 'A':
      tolerance-=2;
      break;
    case 'w':
    case 'W':
      if(red+2>255)break;
      red+=2;
      break;
    case 's':
    case 'S':
      if(red-2<0)break;
      red-=2;
      break;
    case 'e':
    case 'E':
      if(green+2>255)break;
      green+=2;
      break;
    case 'd':
    case 'D':
      if(green-2<0)break;
      green-=2;
      break;
    case 'r':
    case 'R':
      if(blue+2>255)break;
      blue+=2;
      break;
    case 'f':
    case 'F':
      if(blue-2<0)break;
      blue-=2;
      break;
    case 'y':
      drawable = !drawable;
      break;
    case 'u':
      camera = !camera;
      break;
  }
}
