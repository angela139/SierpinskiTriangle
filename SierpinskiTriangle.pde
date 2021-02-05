// global variables to set color and opacity
int r = (int)(Math.random()*255);
int g = (int)(Math.random()*255);
int b = (int)(Math.random()*255);
int o = 10;
boolean magic = false;
public void setup()
{
  size(600, 600);
  background(0);
}
public void draw()
{
  background(0);
  sierpinski(0, height, 600);
}
public void mouseDragged()//optional
{
  
}
// press any key to change triangle to dots that light up random colors
public void keyPressed(){
  magic = true;
  o++;
  r = (int)(Math.random()*255);
  g = (int)(Math.random()*255);
  b = (int)(Math.random()*255);
 
}
public void mousePressed(){
  magic = false;
}
public void sierpinski(float x, float y, int len) 
{
  if (len <= 20){
    if (magic == false){
      fill(r, g, b);
      triangle(x, y, x + len/2, y - len, x + len, y);
    }
    else{
      // uses points/dots to make triangle
      for (int i = 0; i < 10; i++){
          stroke(r, g, b, o);
          strokeWeight(3);
          x = lerp(x, x + len/2, i/10);
          y = lerp(y, y + len/2, i/10);
          point(x,y);
      }
    }
   }

  else{
    sierpinski(x, y, len/2);
    sierpinski(x + len/2, y, len/2);
    sierpinski(x + len/4, y - len/2, len/2);
  }
  
}
