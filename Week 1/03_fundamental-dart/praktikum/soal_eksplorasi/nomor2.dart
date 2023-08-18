void main() {
  int bilangan = 28; 

  print("Faktor dari $bilangan adalah:");
  for (int i = 1; i <= bilangan; i++) {
    if (bilangan % i == 0) {
      print(i);
    }
  }
}