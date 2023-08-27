void main() async{
  int nilai = 5;
  BigInt hasil = await factorialNumber(nilai);

  print("faktorial dari $nilai adalah $hasil");
}

Future<BigInt> factorialNumber(int numb) async{ //menggunakan BigInt sehingga dapat menampung angka yang lebih besar
  if (numb == 0){
    return BigInt.from(1);
  } else {
    return BigInt.from(numb) * await factorialNumber(numb-1);
    }
}
