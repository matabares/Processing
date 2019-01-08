int xx = 0;
int yy = 0;

void setup(){
 //size(SCREEN_WIDTH, SCREEN_HEIGHT);
 fullScreen();
 smooth();
 background(187, 187, 187);
 String[] lines = loadStrings("normaldist.txt");
 println("there are " + lines.length + " lines");
 for (int i = 0 ; i < lines.length; i++) {
   println(lines[i]);
 }
}
void draw(){
	xx++;
	yy++;
 
 //draw path
 noFill();
 stroke(80);
 // I don't undert bezier curve at all!
 bezier(385, 60, 10, 10, 390, 90, 315, 280);
 
 float t = (frameCount/100.0)%1;
 float x = bezierPoint(385, 10, 390, 315, t);
 float y = bezierPoint( 60, 10, 90, 280, t);
 
 fill(68,136,170,200);
 stroke(80);
 ellipse(x, y, 20, 20);
 MyPoint point = new MyPoint(xx,yy);
 ellipse(point.screenX, point.screenY,2,2);
}

class MyPoint
{
	MyPoint(int x, int y)
	{
		this.x= x;
		this.y= y;
		TranslateCartesianToScreen();
		pointColor = color(0, 0, 0);
	}
	float x, y, screenX, screenY;
	color pointColor;

	public void TranslateCartesianToScreen()
	{
		float ZOOM_FACTOR=1;
		int SCREEN_OFFSET_X=0;
		int SCREEN_OFFSET_Y=0;
		this.screenX = ZOOM_FACTOR*this.x + SCREEN_OFFSET_X;
		this.screenY = height - ZOOM_FACTOR*this.y + SCREEN_OFFSET_Y;
	}

	
}

class CartesianPoint
{
	MyPoint cartesianX, cartesianY;
}

public static class Gaussian {

    // return pdf(x) = standard Gaussian pdf
    public static double pdf(double x) {
        return Math.exp(-x*x / 2) / Math.sqrt(2 * Math.PI);
    }

    // return pdf(x, mu, signma) = Gaussian pdf with mean mu and stddev sigma
    public static double pdf(double x, double mu, double sigma) {
        return pdf((x - mu) / sigma) / sigma;
    }

    // return cdf(z) = standard Gaussian cdf using Taylor approximation
    public static double cdf(double z) {
        if (z < -8.0) return 0.0;
        if (z >  8.0) return 1.0;
        double sum = 0.0, term = z;
        for (int i = 3; sum + term != sum; i += 2) {
            sum  = sum + term;
            term = term * z * z / i;
        }
        return 0.5 + sum * pdf(z);
    }

    // return cdf(z, mu, sigma) = Gaussian cdf with mean mu and stddev sigma
    public static double cdf(double z, double mu, double sigma) {
        return cdf((z - mu) / sigma);
    } 

    // Compute z such that cdf(z) = y via bisection search
    public static double inverseCDF(double y) {
        return inverseCDF(y, 0.00000001, -8, 8);
    } 

    // bisection search
    private static double inverseCDF(double y, double delta, double lo, double hi) {
        double mid = lo + (hi - lo) / 2;
        if (hi - lo < delta) return mid;
        if (cdf(mid) > y) return inverseCDF(y, delta, lo, mid);
        else              return inverseCDF(y, delta, mid, hi);
    }
}




