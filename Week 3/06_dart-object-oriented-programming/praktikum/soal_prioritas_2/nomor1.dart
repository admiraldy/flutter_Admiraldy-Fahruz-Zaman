class Calculator{
  int a;
  int b;

  Calculator({required this.a, required this.b});

  int penjumlahan(){
    return a+b;
  }

  int pengurangan(){
    return a-b;
  }

  int perkalian(){
    return a*b;
  }

  double pembagian(){
   return a/b;
  }
}

void main(){
  Calculator calculator = Calculator(a: 5, b: 10);

  print("hasil dari ${calculator.a} + ${calculator.b} adalah ${calculator.penjumlahan()}");
  print("hasil dari ${calculator.a} - ${calculator.b} adalah ${calculator.pengurangan()}");
  print("hasil dari ${calculator.a} * ${calculator.b} adalah ${calculator.perkalian()}");
  print("hasil dari ${calculator.a} / ${calculator.b} adalah ${calculator.pembagian()}");
}