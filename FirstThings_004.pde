// Design inspired by the graphic on page 2 of Islamic Design a Genius for Geometry by David Sutton Published by http://www.woodenbooks.com
// Islamic Design, a Genius for Geometry by Daud Sutton.
// ISBN UK 1-904263-59-3
// US 0-802716-35-0
// By Rupert Russell
// Design avaiable on Redbubble at: https://www.redbubble.com/people/rupertrussell/works/32271168-first-things-first?asc=u


float xCenter = 3600 /2;
float yCenter = 3600 /2;

float scale = 1500;

float[] innerX; // store xPoints for the 6 points on the inner circle
float[] innerY; // store yPoints for the 6 points on the inner circle

float[] outerX;
float[] outerY;

float outerStrokeWeight = 60;
float innerStrokeWeight = 35;

void setup() {

  size(3600, 3600); // width x height
  smooth();

  noFill();
  rectMode(CENTER);
  ellipseMode(CENTER);

  innerX = new float[7];
  innerY = new float[7];

  outerX = new float[7];
  outerY = new float[7];
}



void draw() {
  background(255);
  noLoop();

  translate(xCenter, yCenter); 
  // pushMatrix(); // Remember initial orientation

  calculateNinnerPoints(6, 1);
  calculateNoutterPoints(6, 0.5);

  // Inner circle
  strokeWeight(outerStrokeWeight);
  ellipse(0, 0, scale, scale);




  for (int count = 0; count < 7; count ++) {
    strokeWeight(outerStrokeWeight);
    ellipse(innerX[count], innerY[count], scale, scale);
  }


  for (int count = 0; count < 7; count ++) {
    stroke(255);
    strokeWeight(innerStrokeWeight);
    ellipse(innerX[count], innerY[count], scale, scale);
    ellipse(0, 0, scale, scale);
    stroke(0);
  }


  for (int count = 0; count < 7; count ++) {
  //  ellipse(outerX[count], outerY[count], scale / 10, scale / 10);
  }



  // White Overlays
  fill(255, 0, 0);

  stroke(255);
  strokeWeight(1.5);
  for (int count = 0; count < 7; count ++) {
 // ellipse(outerX[count], outerY[count], scale / 20, scale / 20);
  }

  for (int count = 0; count < 7; count ++) {
   // ellipse(outerX[count], outerY[count], scale / 10, scale / 10);
  }
  
  save("FirstThings_3600.png");
  exit();
} // end Draw



void calculateNinnerPoints(float numPoints, float scaleFactor) {
  // calculate and store n points around the outer circle
  int counter = 0;
  double step = radians(360/numPoints); 
  float h = 0; 
  float k = 0;
  float r =  scale * scaleFactor / 2 ;
  for (float theta=0; theta < 2 * PI; theta += step) {
    float x = h + r * cos(theta);
    float y = k - r * sin(theta); 

    // store the calculated coordinates
    innerX[counter] = x;
    innerY[counter] = y;
    counter ++;
  }
} // end  calculateNinnerPoints


void calculateNoutterPoints(float numPoints, float scaleFactor) {
  // calculate and store n points around the outer circle
  int counter = 0;
  double step = radians(360/numPoints); 
  float h = 0; 
  float k = 0;
  float r =  scale * scaleFactor ;
  for (float theta=0; theta < 2 * PI; theta += step) {
    float x = h + r * cos(theta);
    float y = k - r * sin(theta); 

    // store the calculated coordinates
    outerX[counter] = x;
    outerY[counter] = y;

    if (counter == 2) {
      fill(255, 0, 255);
    } else
    {
      noFill();
    }

    //  ellipse(x, y, 5, 5);
    counter ++;
  }
} // end  calculateNoutterPoints
