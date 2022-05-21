package challenges.multiples_of_3_or_5;

public class Solution {
    public static void main(String[] args) {
        int sum = 0;

        for (int currentNumber = 3; currentNumber < 1000; currentNumber++) {
            if (currentNumber % 3 == 0 || currentNumber % 5 == 0) {
                sum += currentNumber;
            }
        }

        System.out.printf("Answer: %d", sum);
    }
}
