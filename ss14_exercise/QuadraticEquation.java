public class QuadraticEquation {
    public static void main(String[] args) {
    }

    public static void solveQuadraticEquation(double a, double b, double c) {
        if(a == 0) {
            if (b == 0 & c == 0) {
                System.out.println("Infinity");
            }
            if (b == 0 & c != 0) {
                System.out.println("No value");
            }
            if (b != 0 & c == 0) {
                System.out.println("0");
            }
        } else {
            double delta = Math.pow(b, 2) - 4 * a * c;
            if(delta < 0) {
                System.out.println("No value");
            }
            if(delta == 0) {
                System.out.println(-b / (2 * a));
            }
            if(delta > 0) {
                System.out.println((-b + Math.sqrt(delta))/ (2 * a));
                System.out.println((-b - Math.sqrt(delta))/ (2 * a));
            }
        }
    }
}
