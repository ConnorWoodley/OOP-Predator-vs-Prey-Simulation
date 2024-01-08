// Prey Class

class Bunny {
  
  float x; //X position
  float y; //Y position
  float w; //Width of the bunny
  float a; //Angle of the bunny
  float d; //Distance to the closest fox
  float c; //Colour of the bunny, also signifying its speed (brightness -proportional- speed)
  float s; //Speed of the bunny
  float genetics; //Passes on its speed and colour to its kin
  int t; //Time before it reproduces
  int i = 0; //Used for gathering preditor data
  int T = 0; //Longevity
  
  public Bunny(float tempX, float tempY, float tempW, float Rgenetic) {
    this.x = tempX;
    this.y = tempY;
    this.w = tempW;
    this.s = Rgenetic;
    this.genetics = s + random(-0.15,0.2);
    this.c = genetics*100;
    this.t = 300;
  }//End of setup
  
  void move() {
    if (P == 0) {
    //***
    
//Gathering targeted fox's data
    Fox f = fox.get(i);
//End of Gathering targeted fox

//Speed limitations
    if (s > 1.25) {s = 1.25;}
//End of Speed limitations
    
//Angle and distance to closest fox
    a = -atan2(f.y-y,f.x-x);
    d = sqrt(sq(x - f.x) + sq(y - f.y));
//End of Angle and distance
    
//Finding the closest fox
     for (int a1 = fox.size()-1; a1 >= 0; a1--) {
       Fox c = fox.get(a1);
       float d2 = sqrt(sq(x - c.x) + sq(y - c.y));
       if (d > d2) {i = a1;}
     }
//End of Finding     
     
//Running away
    if (d < genetics*100) {x -= cos(a) * s; y += sin(a) * s;}
//End of Running


//Reproducing
    if (bunny.size() < m*10 && t < 0) {t += random(900,600); bunny.add(new Bunny(x + random(-10,10),y + random(-10,10),bunnyWidth,genetics));} else {t -- ;}
//End of Reproducing

//Map bounderies
    if (x < 0 || x > width || y < 0 || y > height) {x = random(width/2 - width/10, width/2 + width/10); y = random(height/2 - height/10, height/2 + height/10);}
//End of Map bounderies
    
    //***
    }//End of Pause
    
//How long this prey has been alive for (this is only for funzies)
  T ++;
  for (int e = bunny.size()-1; e>=0; e--) {
    Bunny g = bunny.get(e);
    if (T < g.T) {fill(0, c + 50, 0);} else {fill(#FCFF5D);}
  }
//longevitiy

  }//end of Move
  
  
  boolean death() {
/* *** - *** - *** - *** - *** - *** - *** - *** - *** - *** - ***
  We Need to find a way to let the main page of the program know that 
  this prey has died. So we use a boolean void function, acting as 
  essentially as a normal void x () {}, but instead opperating at either 
  a ture or false value. This way we can get the most simple and efficient
  way of letting the main page program know that this prey in the prey
  arraylist, is now dead and can be removed from the arraylist.
   *** - *** - *** - *** - *** - *** - *** - *** - *** - *** - *** */
   
    //Eaten
    if (P == 0) {
    Fox f = fox.get(i);
    if (d < w/2) {f.r ++; f.ds = 100; f.t += frameRate; return true;
    } else {return false;}
    }//End of Pause
    return false;
  }//End of Death
    
  void display() {
    // displaying bunny
    strokeWeight(2);
    stroke(0,c,0);
    translate(x,y);
    circle(0,0,w);
    translate(-x,-y);
  }//End of Display
}//End of class
