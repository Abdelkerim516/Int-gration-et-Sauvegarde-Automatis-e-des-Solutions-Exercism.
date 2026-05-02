class RelativeDistance {
  RelativeDistance(this.Famtree);
  Map<String,List<String>> Famtree;
  Map<String,int> relativeDistance = {};
  
  int degreesOfSeparation(String perA, String perB){
    relativeDistance[perA] = 0;
    relativeDistanceFinder(perA, 1, true);
    return relativeDistance.containsKey(perB)?relativeDistance[perB]!:-1;
  }
  void relativeDistanceFinder(String PersNow, int i, bool up){
    if(Famtree.containsKey(PersNow)){
      for(String child in Famtree[PersNow]!){
        if(!relativeDistance.containsKey(child)){
          relativeDistance[child] = i;
          relativeDistanceFinder(child, i+1,false);
        }
      }
    }
    for(String parrents in Famtree.keys){
      if(Famtree[parrents]!.contains(PersNow) && !relativeDistance.containsKey(parrents)){
        relativeDistance[parrents] = i;
        if(up){
          for(String child in Famtree[parrents]!){
            if(!relativeDistance.containsKey(child)){
              relativeDistance[child] = i;
              relativeDistanceFinder(child, i+1,false);
            }
          }
        }
        relativeDistanceFinder(parrents, i+1, true);
      }
    }
  }
}