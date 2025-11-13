class EggCounter {
  // Your code goes here.
  int count(int display) {
    int B = 0; // B 0 pour un emplacement vide
    int A = 1; // A 1 pour un œuf existant 
    while (A <= display) {
      if(A & display != 0) {
        B++;
      }
      A *= 2;
    }
    return B;
  }
}
