class Leap {
  bool res = false;
  bool leapYear(int year) {
    if(year % 400 == 0) {
      res = true;
    } else if (year % 100 == 0){
      res = false;
    } else if (year % 4 == 0){
      res = true;
    } else {
      res = false;
    }
    return res;
  }
}
