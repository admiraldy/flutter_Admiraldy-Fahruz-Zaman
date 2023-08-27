void main(){
  int nilai = 70;
  hasilNilai(nilai);
}

void hasilNilai(int nilai){
  if(nilai > 70){
    print("nilai A");
  } else if (nilai > 40) {
    print("nilai B");
  }else if (nilai > 0) {
    print("nilai C");
  } else {
    print("");
  }
}