
var rectX = 0;
var fr = 30; //starting FPS
var clr;

function setup() {
	background(200);
  	//frameRate(fr); // Attempt to refresh at starting FPS
  	clr = color(255, 0, 0);
  	clr2 = color(255, 200, 0);
  	smooth();
}

/*function draw() {
	background(200);
  rectX = rectX += 1; // Move Rectangle

  if (rectX >= width) {
   // If you go off screen.
    if (fr === 30) {
      clr = color(0, 0, 255);
      fr = 10;
      frameRate(fr); // make frameRate 10 FPS
    } else {
      clr = color(255, 0, 0);
      fr = 30;
      frameRate(fr); // make frameRate 30 FPS
    }
    rectX = 0;
  }
  fill(clr);
  ellipse(rectX, 40, 20, 20);
  point(rectX+20, 40);
  fill(clr2);
  ellipse(rectX, 100, 20, 20);
}*/

function draw(){
 background(187, 187, 187);
 //draw path
 noFill();
 stroke(80);
 // I don't undert bezier curve at all!
 bezier(385, 60, 10, 10, 390, 90, 315, 280);
 
 var t = (frameCount/100.0)%1;
 var x = bezierPoint(385, 10, 390, 315, t);
 var y = bezierPoint( 60, 10, 90, 280, t);
 
 fill(68,136,170,200);
 stroke(80);
 ellipse(x, y, 20, 20);
 
}