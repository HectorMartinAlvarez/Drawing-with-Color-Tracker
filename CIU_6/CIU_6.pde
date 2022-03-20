import JMyron.*;
import java.util.List;
import java.util.ArrayList;

List<int[]> figure = new ArrayList<int[]>();
int red = 0;
int green = 0;
int blue = 255;
int tolerance = 255;
boolean drawable = false;
boolean camera = true;
boolean contorno = true;
boolean T1 = false;
boolean T2 = false;
boolean R1 = false;
boolean R2 = false;
boolean G1 = false;
boolean G2 = false;
boolean B1 = false;
boolean B2 = false;

PImage help;
JMyron m;
 
void setup(){
  size(640,480);
  help = loadImage("data/help.jpg");
  m = new JMyron();
  m.start(640,480);
  m.findGlobs(1);
  println("Myron " + m.version());
}

void mousePressed(){
  if(mouseX > width-50 && mouseY < 50){
    new Help();
  }else{
    m.settings();
  }
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
  
  image(help, width-50,1,50,50);
  
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
  text("Tol:"+(int)tolerance,1,40);
  text("Draw:"+drawable,1,60);
  text("Contour:"+contorno,1,80);
  textAlign(RIGHT);
  text("Tracking:",width-40,height-10);
  fill(color(red,green,blue,tolerance));
  rect(width-40,height-40,40,40);
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
   changeValues();
}

public void stop(){
  m.stop();
  super.stop();
}

void changeValues(){
  if(T1){
    if(tolerance+1<=299){
      tolerance+=1;
    }
  }
  if(T2){
    if(tolerance-1>=0){
      tolerance-=1;
    }
  }
  if(R1){
    if(red+1<=255){
      red+=1;
    }
  }
  if(R2){
    if(red-1>=0){
      red-=1;
    }
  }
  if(G1){
    if(green+1<=255){
      green+=1;
    }
  }
  if(G2){
    if(green-1>=0){
      green-=1;
    }
  }
  if(B1){
    if(blue+1<=255){
      blue+=1;
    }
    
  }
  if(B2){
    if(blue-1>=0){
      blue-=1;
    }
  } 
}

void keyPressed(){
  switch(key){
    case 'c':
    case 'C':
      figure.clear(); 
      break;
    case 'q':
    case 'Q':
      T1 = true;
      break;
    case 'a':
    case 'A':
      T2 = true;
      break;
    case 'w':
    case 'W':
      R1 = true;
      break;
    case 's':
    case 'S':
      R2 = true;
      break;
    case 'e':
    case 'E':
      G1 = true;
      break;
    case 'd':
    case 'D':
      G2 = true;
      break;
    case 'r':
    case 'R':
      B1 = true;
      break;
    case 'f':
    case 'F':
      B2 = true;
      break;
    case 'y':
    case 'Y':
      drawable = !drawable;
      break;
    case 'h':
    case 'H':
      camera = !camera;
      break;
    case 'b':
    case 'B':
      contorno = !contorno;
      break;  
  }
}

void keyReleased(){
  switch(key){
    case 'q':
    case 'Q':
      T1 = false;
      break;
    case 'a':
    case 'A':
      T2 = false;
      break;
    case 'w':
    case 'W':
      R1 = false;
      break;
    case 's':
    case 'S':
      R2 = false;
      break;
    case 'e':
    case 'E':
      G1 = false;
      break;
    case 'd':
    case 'D':
      G2 = false;
      break;
    case 'r':
    case 'R':
      B1 = false;
      break;
    case 'f':
    case 'F':
      B2 = false;
      break;
  }
}
