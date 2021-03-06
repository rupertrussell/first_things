float xCenter = 600 /2;
float yCenter = 600 /2;

float scale = 200;

float[] innerX; // store xPoints for the 6 points on the inner circle
float[] innerY; // store yPoints for the 6 points on the inner circle

float[] outerX;
float[] outerY;


void setup() {

  size(600, 600); // width x height

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
  strokeWeight(8);
  ellipse(0, 0, scale, scale);




  for (int count = 0; count < 7; count ++) {
    strokeWeight(8);
    ellipse(innerX[count], innerY[count], scale, scale);
  }


  for (int count = 0; count < 7; count ++) {
    stroke(255);
    strokeWeight(4);
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
  
  save("first_things_003.png");
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
