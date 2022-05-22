package challenges.largest_prime_factor;

public class Solution {
    public static void main(String[] args) {
        final long product = 600851475143L;
        final long largestPrimeFactor;

        for (long smallerFactor = 2; true; smallerFactor++) {
            boolean isPrimeFactor = true;

            if (product % smallerFactor == 0) {
                final long largerFactor = product / smallerFactor;
                final long largerFactorHalf = largerFactor / 2;

                for (long divisor = 2; divisor < largerFactorHalf; divisor++) {
                    if (largerFactor % divisor == 0) {
                        isPrimeFactor = false;
                        break;
                    }
                }
                if (isPrimeFactor) {
                    largestPrimeFactor = largerFactor;
                    break;
                }
            }
        }

        System.out.printf("Answer: %d", largestPrimeFactor);
    }
}
