package challenges.even_fibonacci_numbers;

public class Solution {
    public static void main(String[] args) {
        int sum = 0;
        int[] previousTerms = new int[] {1, 2};

        while (previousTerms[1] < 4000000) {
            if (previousTerms[1] % 2 == 0) {
                sum += previousTerms[1];
            }
            int nextTerm = previousTerms[0] + previousTerms[1];
            previousTerms[0] = previousTerms[1];
            previousTerms[1] = nextTerm;
        }

        System.out.printf("Answer: %d", sum);
    }
}
