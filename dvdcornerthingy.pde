int screenSize_x = 1440;
int screenSize_y = 810;

//class MyClass {
//  int example;
//  MyClass(int example_input){
//    example = example_input;
//  }
//  void method(){
//    //do function things here
//  }
//  void update(){
//    //update method for numbers/movement
//  }
//  void render(){
//    //render method
//  }
//}


//MyClass[] objects = new MyClass[1];


void settings()
{
  size(screenSize_x,screenSize_y);
}

PVector direction = PVector.random2D();

float x,y,xPrev,yPrev;
float hue = 0;
boolean contact;

int[] randomColour()
{
  int[] colour = {
  int(random(0,256)),
  int(random(0,256)),
  int(random(0,256))};
  
  return colour;
}
void setup()
{
  frameRate(60);
  colorMode(HSB,100);
  background(0,0,0);
  direction.setMag(8);
  x = width/2;
  y = height/2;
  contact = false;
  //MyClass object1 = new MyClass(0);
  //objects[0] = object1;
}

void process()
{
  hue += 1;
  if (hue > 100) {hue = 0;}
  xPrev = x;
  yPrev = y;

  if (contact != true){
    if(x <= 0 || x >= width)
    {
      direction.x = -direction.x;
      contact = true;
    }
    if(y <= 0 || y >= height)
    {
      direction.y = -direction.y;
      contact = true;
    }
  }
  else
  {
    if(x <= 0){x=0;}
    else if (x >= width){x = width;}
    if(y <= 0){y=0;}
    else if (y >= height){y = height;}
    contact = false;
  }
  x+= direction.x;
  y+= direction.y;
  print(x,y,"\n");
  //for (int i = 0; i < objects.length ;i++){
  //  objects[i].update();
  //}
}

void draw()
{
  process();
  stroke(hue,100,100);
  
  line(xPrev,yPrev,x,y);
  //for (int i = 0; i < objects.length ;i++){
  //  objects[i].render();
  //}
}
