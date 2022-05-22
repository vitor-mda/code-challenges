const product = 600851475143;
let largestPrimeFactor;

for (let smallerFactor = 2; !largestPrimeFactor; smallerFactor++) {
    let isPrimeFactor = true;

    if (product % smallerFactor === 0) {
        const largerFactor = product / smallerFactor;
        const largerFactorHalf = largerFactor / 2;

        for (let divisor = 2; divisor < largerFactorHalf; divisor++) {
            if (largerFactor % divisor === 0) {
                isPrimeFactor = false;
                break;
            }
        }

        if (isPrimeFactor) largestPrimeFactor = largerFactor;
    }
}

console.log(`Answer: ${largestPrimeFactor}`);
