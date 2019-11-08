float rot1 = 0, rot2 = 0, rot3 = 0, x1=0, z1=0, x2=0, z2=0, x3=0, z3=0;
int dim=200;
float x[] = new float[dim], y[] = new float[dim];
float t=0;
float y1;
void setup() 
{
  size(1300,700,P3D);
  for(int i = 0; i<x.length;i++)
  {
    x[i] = random(width)*4-1100;
    y[i] = random(height)*4-600;
  }
}

void draw() 
{
  // Se calcula el angulo de cada planeta
  rot1 = t/13;
  rot2 = t/10;
  rot3 = t/11;
  
  // Calcula posición del planeta 1
  x1 = 130*cos(rot1);
  z1 = 300*sin(rot1)+100;
  // Calcula posición del planeta 2
  x2 = 70*cos(rot2);
  z2 = 200*sin(rot2)+50;
  // Calcula posición del planeta 3
  x3 = 180*cos(rot3);
  z3 = 380*sin(rot3)+80;
  
  // Se borra la pantalla 
  background(0);
  // Se define relleno blanco
  fill(255);
  
  // Alejando la pantalla 1000 pixeles
  translate(0,0,-1000);
  
  // Algoritmo para mostrar las estrellas 
  for(int i = 0; i<x.length;i++)
  {
    ellipse(x[i],y[i],0.5*sin(t+i/2)+2,0.5*sin(t+i/2)+2);
  }
  
  // Ubicación del centro del sol
  translate(550,350,1200);
  
  // Activa la fuente de luz 
  lights();
  
  // Calcula la orientación en base a la ubicación del mouse
  rotateX(map(mouseY,0,height,-PI,PI));
  rotateY(map(mouseX,0,width,-PI,PI));
  
  // Se realiza un giro de 90 grados en el eje X 
  rotateX(PI/2);
  
  // La elipse se especifica con la ubicación de su centro
  ellipseMode(RADIUS);
  
  //Se definen que las lineas sean de color blanco
  stroke(255);
  
  // Las primitivas se dibujan sin relleno
  noFill();
  
  //Se dibuja el planeta 1
  rotateY(0.4);
  rotateZ(0.2);
  translate(x1, z1, 0);
  fill(255, 63, 255);
  noLights();
  directionalLight(255, 255, 255, x1/sqrt(pow(x1,2)+pow(z1,2)), z1/sqrt(pow(x1,2)+pow(z1,2)), 0);
  noStroke();
  sphere(15);
  translate(-x1, -z1, 0);
  noFill();
  stroke(255);
  ellipse(0, 100, 130, 300);
  rotateZ(-0.2);
  rotateY(-0.4);
  
  //Se dibuja el planeta 2
  rotateY(0.1);
  translate(x2, z2, 0);
  fill(100, 63, 255);
  noLights();
  directionalLight(255, 255, 255, x2/sqrt(pow(x2,2)+pow(z2,2)), z2/sqrt(pow(x2,2)+pow(z2,2)), 0);
  noStroke();
  sphere(10);
  translate(-x2, -z2, 0);
  noFill();
  stroke(255);
  ellipse(0, 50, 70, 200);
  rotateY(0.1); 

  //Se dibuja el planeta 3
  rotateX(0.1);
  translate(x3, z3, 0);
  fill(100, 200,160);
  noLights();
  directionalLight(255, 255, 255, x3/sqrt(pow(x3,2)+pow(z3,2)), z3/sqrt(pow(x3,2)+pow(z3,2)), 0);
  noStroke();
  sphere(18);
  noFill();
  translate(-x3, -z3, 0);
  stroke(255);
  ellipse(0, 80, 180,380);
  rotateX(-0.1);
  
  // Las primitivas se dibujan sin linea de contorno
  noStroke();
  
  //Se especifica el color de Sol y se dibuja
  fill(200, 50, 0,255);
  lights();
  sphere(50);
  
  //Se incremena el tiempo
  t += 0.1;
  delay(10);
}