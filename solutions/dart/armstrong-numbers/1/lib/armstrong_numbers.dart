class ArmstrongNumbers {
  // Put your code here
  bool isArmstrongNumber(String number) {
    var sum = BigInt.from(0.0);
    final length = number.length;
    for(int i = 0; i < length; i++) {
      sum += BigInt.from(num.parse(number[i])).pow(length);
    }
    return sum.toString() == number;
  }
}
