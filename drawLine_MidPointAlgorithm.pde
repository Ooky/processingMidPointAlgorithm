public color black; 
public color blue;
public color white;
public int dx;
public int dy;
public int incrE;
public int incrNE;
public int d;
public int x;
public int y;
public int change;

void setup() {
  //Init
  background(0, 0, 0);
  size(513, 513);
  //surface.setResizable(true); //Works, but bugs other things?
  //Pixels
  black = color (0, 0, 0);
  blue = color (0, 90, 255);
  white= color (255, 255, 255);
  //DrawLine 
  loadPixels();
  myLine(0, 0, 512, 512);//Diagonal
  for (int i = 0; i <30; i+=6) {
  myLine(512, i, 0, 0);
  }
  myLine(0,500,500,0);
  updatePixels();
}
//Pos in Array: i=y*width+x
void myLine(int x0, int y0, int x1, int y1) {
  if(x0>=x1 && y0>=y1) {
    change = x1;
    x1=x0;
    x0=change;
    
    change =y1;
    y1=y0;
    y0=change;
  }
  dx = x1 -x0;//deltaX
  dy= y1-y0;//deltaY
  d=dy*2 -dx;
  incrE = dy*2;
  incrNE = (dy-dx) *2;
  x = x0;
  y=y0;
  pixels[y*width+x]= white;
  while (x<x1) {
    if (d <= 0) {//d>=0=NE, d<=0=E
      d+= incrE;
      x++;
    } else {
      d+= incrNE;
      x++;
      y++;
    }
    pixels[y*width+x] = white;
  }
}