let sum = 0;

for (let currentNumber = 3; currentNumber < 1000; currentNumber++) {
    if (currentNumber % 3 == 0 || currentNumber % 5 == 0) {
        sum += currentNumber;
    }
}

console.log(`Answer: ${sum}`);
