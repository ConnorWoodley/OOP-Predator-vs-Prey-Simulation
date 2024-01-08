//Predator class

class Fox {
  
  float x; //X position
  float y; //Y position
  float w; //Width of the fox
  float a; //Angle of the fox
  float d; //Distance to the closest bunny
  float c; //Colour of the fox, also signifying its speed (brightness -proportional- speed)
  float s; //Speed of the fox
  float genetics; //Passes on its speed and colour to its kin
  int t; //Time before it dies from starvation
  int ds = 100; //Used as a way to sort its furthest pray to its closest
  int i = 0; //Used for gathering pray data
  int r; //Number of times the fox ate, if the fox eats 3 bunnies, it reproduces
  int T; //Longevity
  float d2; //Used to compare distances
  
  public Fox(float tempX, float tempY, float tempW, float Rgenetic) {
    this.x = tempX;
    this.y = tempY;
    this.w = tempW;
    this.s = Rgenetic;
    this.genetics = s + random(-0.1,0.2);
    this.c = genetics*100;
    this.t = 1200;
  }//End of Setup
  
  void move() {
   if (P == 0) {
   //***
   
//Gathering targeted bunny's data
  if (i > bunny.size() -1) {i = bunny.size() -1;}
  Bunny b = bunny.get(i);
//End of Gathering targeted bunny

//Speed limitations
    if (s > 2) {s = 2;}
//End of Speed limitations

//Angle and distance to the closest fox
    d = sqrt(sq(x - b.x) + sq(y - b.y));
    if (bunny.size() > 1) {
      for (int a1 = bunny.size()-2; a1 >= 0; a1--) {
        Bunny c = bunny.get(a1);
        d2 = sqrt(sq(x - c.x) + sq(y - c.y));
        if (d > d2) {i = a1;}
      }
    }
   a = atan2(b.y -y,b.x -x);
//End of Angle and distance
   
//Chasing
   x += cos(a) * s;
   y += sin(a) * s;
//End of Chasing


//Starving
   t -= 1;
//End of Starving

//Reproducing
   if (r >= 3) {r = 0; fox.add(new Fox(x + random(-50,50),y + random(-50,50),foxWidth,genetics));}
//End of Reproducing

   //***
   }//End of pause
   
//How long this prey has been alive for (this is only for funzies)
  T ++;
  for (int e = fox.size()-1; e>=0; e--) {
    Fox g = fox.get(e);
    if (T < g.T) {fill(c + 50, 0 , 0);} else {fill(#FCFF5D);}
  }
//longevitiy

  }//End of Move
  
  
  boolean death() {
/* *** - *** - *** - *** - *** - *** - *** - *** - *** - *** - ***
  We Need to find a way to let the main page of the program know that 
  this predator has died. So we use a boolean void function, acting as 
  essentially as a normal void x () {}, but instead opperating at either 
  a ture or false value. This way we can get the most simple and efficient
  way of letting the main page program know that this predator in the predipredatortor
  arraylist, is now dead and can be removed from the arraylist.
   *** - *** - *** - *** - *** - *** - *** - *** - *** - *** - *** */
   
    //Starved
    if (t < 0) {return true;} else {; return false;}
  }//End of Death
  
  
  void display() {
//Displaying fox
    strokeWeight(2);
    stroke(c,0,0);
    translate(x,y);
    circle(0,0,w);
    translate(-x,-y);
  }//End of Display
  
}//End of class
