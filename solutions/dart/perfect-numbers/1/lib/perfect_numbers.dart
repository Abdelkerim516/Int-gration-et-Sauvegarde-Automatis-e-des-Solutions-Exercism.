// define the Classification enum

enum Classification {
  // Abdel_Abbo
  perfect,abundant,deficient
}
class PerfectNumbers {
  // Put your code here
  
  Classification classify(int num){
    if(num==0|| num<0){
      throw ArgumentError();
    }
    int sum=0;
    for (int i=1;i<=num/2;i++){
      if(num%i==0){
        sum+=i;
      }
    }
    if(sum==num){
      return Classification.perfect;
    }else if(
      sum<num
    ){
      return Classification.deficient;
    }else return Classification.abundant;
  }
}
