void main(){
  int nilai = 50;
  BigInt hasil = factorialNumber(nilai);

  print("faktorial dari $nilai adalah $hasil");
}

BigInt factorialNumber(int numb){ //menggunakan BigInt sehingga dapat menampung angka yang lebih besar
  if (numb == 0){
    return BigInt.from(1);
  } else return BigInt.from(numb) * factorialNumber(numb-1);
}
