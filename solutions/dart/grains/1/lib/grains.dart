BigInt square(final int n) {
  // Abdel_Abbo
  // Replace the throw call and put your code here
  BigInt result = BigInt.from(1);
  if(n<1 || n > 64) throw ArgumentError('square must be between 1 and 64');
  for (int i = 0; i< n-1; i++)result = result * BigInt.from(2);
  return result;
}

BigInt total() {
  // Replace the throw call and put your code here
  BigInt total = BigInt.from(0);
  for(int i=1; i<65; i++){
    total += square(i);
  }
  return total;
}
