// Implement a custom InvalidNucleotideException exception
class InvalidNucleotideException implements Exception{
  final String message;
  InvalidNucleotideException(this.message);
}
class NucleotideCount {
  Map<String,int> count(String strand){
     Map<String,int> output={"A":0,"C":0,"G":0,"T":0};
    const validNucleotides = {"A", "C", "G", "T"}; 
    if(strand==""){
      return output;
    }
 
   
    strand.split("").forEach((val){
      if(!validNucleotides.contains(val)){
       throw InvalidNucleotideException("INVALID");
      }else{
         output[val]=output[val]!+1;
      }
      
    });
      return output;
  }
  // Put your code here
}
