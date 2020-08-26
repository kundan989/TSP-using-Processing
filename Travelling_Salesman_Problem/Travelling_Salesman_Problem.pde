PVector[] cities;
int no_of_cities=10;

float recorddistance;
PVector[] bestever;

void setup()
{
  size(600,600);
  cities = new PVector[no_of_cities];
  bestever = new PVector[no_of_cities];
  for(int i=0; i<no_of_cities; i++)
  {
    PVector v = new PVector(random(width), random(height));  //create points at random position
    cities[i]=v;  //and store it in an array
  }
  
  float d= calcDistance(cities);
  recorddistance = d;
  arrayCopy(cities,bestever);
}

void draw()
{
  background(0);
  for(int i=0; i<no_of_cities; i++)
  {
    ellipse(cities[i].x,cities[i].y,8,8);  //plot the points
  }
  
  //now join the points with lines as vertex
  
  stroke(255);  //to give the lines white colour i.e.255
  strokeWeight(1);  //to give the line some thickness
  noFill();
  beginShape();
  for(int i=0; i<no_of_cities; i++)
  {
    vertex(cities[i].x,cities[i].y);
  }
  endShape();
  
  stroke(255, 0, 255);
  strokeWeight(4);
  noFill();
  beginShape();
  for (int i = 0; i < cities.length; i++) {
    vertex(bestever[i].x, bestever[i].y);
  }
  endShape();
  
  int i = floor(random(cities.length));
  int j = floor(random(cities.length));
  swap(cities, i, j);

float d = calcDistance(cities);
  if (d < recorddistance) 
  {
    recorddistance = d;
    arrayCopy(cities, bestever);
  }
}

void swap(PVector[] a, int i, int j)
{
  PVector temp=a[i];
  a[i]=a[j];
  a[j]=temp;
}

float calcDistance(PVector[] points) {
  float sum = 0;
  for (int i = 0; i < points.length - 1; i++) {
    float d = dist(points[i].x, points[i].y, points[i + 1].x, points[i + 1].y);
    sum += d;
  }
  return sum;
}
