class Proverb {
  // Abdel_Abbo
   String recite(List pieces){
    String output="";
    if(pieces.length==0){
      return "";
    }
    else if(pieces.length==1){
      return "And all for the want of a ${pieces[0]}.";
    }else {
     for (int i=0;i<pieces.length;i++){
       if(i<pieces.length-1){
       output +='''For want of a ${pieces[i]} the ${pieces[i+1]} was lost.\n''';}else{
          output +='''And all for the want of a ${pieces[0]}.''';
       }
     }
    }
    return output;
  }
}
