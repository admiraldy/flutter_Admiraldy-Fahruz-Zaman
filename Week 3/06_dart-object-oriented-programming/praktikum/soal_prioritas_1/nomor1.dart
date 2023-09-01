class Hewan{
  int beratHewan;
  String namaHewan;

  Hewan({required this.namaHewan, required this.beratHewan,});
}

void main(){
  Hewan hewan1 = Hewan(namaHewan: 'kambing', beratHewan: 50,);
  print("berat ${hewan1.namaHewan} adalah ${hewan1.beratHewan}");
}