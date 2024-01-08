void calculations () {
  
  //Graph A) Prey vs Preditor Population
  translate(25,25);
  stroke(0);
  fill(250, 200);
  rect(0,0, 150,100);
  fill(0);

    //Bordering the graph
    strokeWeight(2);
    stroke(0);
    fill(0, 200);
    rect(0,0, 0, 100);
    rect(0,100, 150,0);
    
    //Bar Gragh (Prey)
        fill(0,150,0, 200);
        textAlign(RIGHT);
        text(bunny.size(),-5,(-bunny.size()/(m*10))*100+100);
        fill(0,255,0, 200);
        rect(30,100, 25,(-bunny.size()/(m*10))*100);
        fill(0);
    
    //Bar Gragh (Predator)
        fill(255,0,0, 200);
        textAlign(RIGHT);
        text(fox.size(),-5,(-fox.size()/(m*10))*100+100);
        rect(85,100, 25,(-fox.size()/(m*10))*100);
        fill(0);
        
  translate(-25,-25);
  //End of Graph A)

  //Manuel Speed Manipulator Buttons//Clarifications
    translate(25,150);
    textAlign(LEFT);
    text("Max Prey #: " + m*10, 0,0);
    text("f - fast forward || space - pause", 0,25);
    text("UP Arrow:Spawn Max ++ || DOWN Arrow: Max --", -20,50);
}
