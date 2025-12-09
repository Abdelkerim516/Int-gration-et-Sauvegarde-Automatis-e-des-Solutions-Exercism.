class Strain {
  // your code here...
  // Abdel_Abbo
  List keep(List values, Function fn) {
    List result = [];
    for(var value in values) {
      if(fn(value)) {
        result.add(value);
      }
    }
    return result;
  }
  List discard(List values, Function fn) {
    List result = [];
  for (var value in values) {
    if(!fn(value)){
      result.add(value);
    }
  }
    return result;
  }
}
