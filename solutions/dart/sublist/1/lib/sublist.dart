// Implement the Classification enum.
enum Classification{
  sublist,superlist,equal,unequal
}
// Abdel_Abbo
class Sublist {
  // your code here...
 Classification sublist(List list1, List list2){
   if(list1.isEmpty&&list2.isEmpty){
    return Classification.equal;
   }
   else if(list1.isEmpty){
      return Classification.sublist;
   }
   else if (list2.isEmpty) {
      return Classification.superlist;
    }
  else if(isTwolistEqual(list1,list2)){
    return Classification.equal;
  }
   else if(isSublist(list1,list2)){
     return Classification.sublist;
   } else if(isSublist(list2,list1)){
     return Classification.superlist;
   }
   else{
     return Classification.unequal;
   }
  }
  bool isSublist(List small, List large){
    if(small.length>large.length) return false;
    for(int i=0;i<=large.length-small.length;i++){
      List trimmedList=large.sublist(i,i+small.length);
       if(isTwolistEqual(trimmedList,small)){
         return true;
       }
    }
    return false;
  }
  bool isTwolistEqual(List first, List second){
    if(first.length!=second.length) return false;
    for (int i=0;i<first.length;i++){
      if(first[i]!=second[i]){
        return false;
      }
    }
    return true;
  }
}