void main(){
  List nilai = [7, 5, 3, 5, 2, 1];
  int hasilRatarata = jumlahRatarata(nilai);

  print("rata-rata dari $nilai adalah $hasilRatarata");
}
 int jumlahRatarata(List nilai){
  double totalRatarata = 0;
  int jumlah = nilai.length;

  for(int i = 0; i < jumlah; i++){
    totalRatarata += nilai[i];
  }
  double ratarata = totalRatarata / jumlah;
  int pembulatan = ratarata.toInt() + (ratarata > ratarata.toInt() ? 1:0);

  return pembulatan;
 }