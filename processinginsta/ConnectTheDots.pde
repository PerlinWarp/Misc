//Inspired by
//http://p5art.tumblr.com/post/115788030473/p5art-connecting-the-dots-lifting-the-veil

int num = 50; //Number of balls
ArrayList<PVector> positions;
ArrayList<PVector> velocities;

int frames = 0;

void setup(){
  size(500,500);
  noSmooth();
  positions = new ArrayList();
  velocities = new ArrayList();
  
  //Initalise the balls
  for(int i = 0; i < num; i++){
    positions.add(new PVector(random(500),random(500)));
    velocities.add(new PVector(random(-4,4), random(-4,4)));
  }
  
}

void draw(){
  background(#332532);
  stroke(100,37,50);
  strokeWeight(10);
  
  for (int i = 0; i < num; i++){
    float px = positions.get(i).x;
    float py = positions.get(i).y;
    float vx = velocities.get(i).x;
    float vy = velocities.get(i).y;
    //Check Wall Collisions
    if (px >= 500){px = 500; vx *= -1;}
    if (py >= 500){py = 500; vy *= -1;}
    if (px <= 0){px = 0; vx *= -1;}
    if (py <= 0){py = 0; vy *= -1;}
    point(px, py);
    
    //Updating the changes made to our local variables back into the array
    positions.get(i).x = px;
    positions.get(i).y = py;
    velocities.get(i).x = vx;
    velocities.get(i).y = vy;
    
    //Updating the position
    positions.get(i).x += vx;
    positions.get(i).y += vy; 
  }
  for (int i = 0; i < num; i++){
    for (int j = 0; j < num; j++){
      if(i == j){break;}
      //Do we need to draw a line between them?
      //If the distance between them is less then the radius of the circle, e.g. 10. 
      float dist = (positions.get(i)).dist(positions.get(j));
      if(dist < 100){
        strokeWeight(6);
        line(positions.get(i).x,positions.get(i).y,positions.get(j).x,positions.get(j).y);
      }
    }
   }
   
   //Save That Frame
  frames++;
  if(frames < 100){
    saveFrame("Anim-###/image-###.gif");
  }
}
