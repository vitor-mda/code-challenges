let sum = 0;
let previousTerms = [1, 2];

while (previousTerms[1] < 4000000) {
    if (previousTerms[1] % 2 === 0) {
        sum += previousTerms[1];
    }
    const nextTerm = previousTerms[0] + previousTerms[1];
    previousTerms = [previousTerms[1], nextTerm];
}

console.log(`Answer: ${sum}`);
