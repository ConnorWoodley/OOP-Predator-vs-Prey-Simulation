/**
 * Preditor Vs Prey Simulator
 Guided and taught by "ArrayList of Objects", By Danial Shiffman.
 
 Brief overview:
   I am using this program to demonstrate my understanding of the class, ArrayLists, Arrays, and objects.
   I do believe that this program proves my understanding thoroughly. I'm not really one for writing
   essays and lab write ups, so I'll let you do the looking while dropping some peices of information
   along the way.
   
Goal;
  Hopefully I can use this understanding to my benifit as I continue to make my game! Judgement Reedemed.
  and also to show this to my bio teacher, Mr Potts. I missed a week of school and I am gonna use this
  as like sort of a gift for his classes about natural selection... I hope he likes a somewhat buggy mess.
 */



ArrayList<Bunny> bunny;
ArrayList<Fox> fox;
/*    ArrayList - An unlimited array, the way I think of this is almost like a number line. You can keep stretching the line
    when you add more numbers, and make the line shorter by removing numbers.
    < 0 - 1 - 2 - 3 - 4 - 5 - 6 - 7 - 8 - 9 - 10 - ... >
    Say we wanted to look at number 5. If we wanted to we could remove the number 5 from this numberline.
    However if we did, we would only be moving 6 into 5's place, and 7 into 6's, and so on. Same goes for adding a number. We would just be moving everything up.
    Continuing on from this, you'll see later on after an ArrayList statement, we have <Bunny>. This <Bunny> is whats called a <Type>, it essentially means in this
    case that our type we want is for a class. and the regular "bunny" that comes after means the size of our ArrayList is a variable, so we can theoretically have
    an infinate number of <Bunny>'s. */
    
int bunnyWidth = 8;//Width of the bunny, try to keep it smaller.
int foxWidth = bunnyWidth + bunnyWidth/2;//Width of the fox, always larger than the bunny

int P = 0;//Just in case things get hectic
int F = 0;//Fast Forwarding

float m = 20;//Changing speed of maunally spawning predators and preys

void setup() {
  size(1024, 480);
  //fullScreen();
  noStroke();

  //Creating an empty ArrayList
  bunny = new ArrayList<Bunny>();
  fox = new ArrayList<Fox>();
  
  /*Adding some elements so the program will start.
  .add() adds a new object/number to the arraylist.
  */
  fox.add(new Fox(width/2 + 50, height/2, foxWidth,0.75));
  bunny.add(new Bunny(width/2, height/2, bunnyWidth,0.5));
}

void draw() {
  background(255);
  textAlign(CENTER);
  text("Predator VS Prey Simulation", width/2,50);
  
//Cycling through the entire list so we are able to gather data of every single bunny.
  for (int i = bunny.size()-1; i >= 0; i--) { 
    //By saying bunny.get(i); we are able to gather data from the current index value, and then move onto the next.
    Bunny b = bunny.get(i);
    b.move();
    b.display();
    if (b.death()) {bunny.remove(i);}//If the boolean death() value is true, we can remove this current bunny.
  }
//End of Cycling Bunny
  
  
//Cycling through the entire list so we are able to gather data of every single fox.
  for (int i = fox.size()-1; i >= 0; i--) { 
    //By saying fox.get(i); we are able to gather data from the current index value, and then move onto the next.
    Fox f = fox.get(i);
    f.move();
    f.display();
    if (f.death()) {
      for (int a = bunny.size()-1; a >= 0; a--) {
      Bunny b = bunny.get(a); 
      b.i = 0;
      }//If the fox dies, we need to make sure the bunny targeting it resets their index value
      fox.remove(i);//If the boolean death() value is true, we can remove this current bunny.
    }
  }
//End of Cycling Fox
  
  
//Making sure both the fox and bunny sizes never equal 0, we need at least one fox and three bunnies on the feild in order for the code to work properly.
  Bunny b = bunny.get(0);//Further into the simulation, if all fox's died they could never catch up to already fast prey so we take a bunny's speed and use it as a base for this backup fox
  if (fox.size() == 1) {fox.add(new Fox(random(50,width-50), random(50,height-50),foxWidth,b.s + 0.2));}
  
  
  Fox f = fox.get(0);//Further into the simulation, if all bunnies died they could never catch up to already fast preditor so we take a fox speed and use it as a base for this backup bunny
  if (bunny.size() < 3) {bunny.add(new Bunny(random(50,width-50), random(50,height-50),bunnyWidth,f.s));}
  
  //Pretty things (:
  calculations();
  
  //Making sure the fast forward and pause functions dont bug out and make me cry
  if (F == 1) {frameRate(600);} else {F = 0; frameRate(60);}
  if (P == 2) {P = 0;}
}


void mousePressed() {
  //manually adds a new fox or bunny
  if (mouseButton == RIGHT) {fox.add(new Fox(mouseX, mouseY, foxWidth,0.75));}
  if (mouseButton == LEFT) {bunny.add(new Bunny(mouseX, mouseY, bunnyWidth,0.5));}
}

void keyPressed() {
  //for some bug fixes and to get a better look at things 
  if (key == 'f') {F ++;}
  if (key == ' ') {P ++;}
  if (keyCode == UP) {m ++;}
  if (keyCode == DOWN && m > 1) {m --;}
}
