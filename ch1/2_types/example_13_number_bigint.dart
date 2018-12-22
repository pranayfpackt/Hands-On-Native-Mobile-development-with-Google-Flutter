/**
 * The BigInt type
 */
main() {
    int maxInt = (2e63-1).toInt(); // the biggest signed integer an 'int' can store 9223372036854775807
    
    print(maxInt*2); // becomes negative, as it already have all the number bits as '1'
    
    BigInt bigInt = BigInt.from(maxInt);
    print(bigInt * BigInt.from(2)); // will not overflow, instead print the wanted value: 18446744073709551614    
}