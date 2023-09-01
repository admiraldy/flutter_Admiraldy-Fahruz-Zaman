class Hewan{
  int beratHewan;
  String namaHewan;

  Hewan({required this.namaHewan, required this.beratHewan,});
}

class Mobil {
  int kapasitas;
  List<Hewan> muatan = [];

  Mobil({required this.kapasitas});

  int totalMuatan() {
    int berat = 0;
    int jumlahMuatan = muatan.length;

  for(int i = 0; i < jumlahMuatan; i++){
    berat += muatan[i].beratHewan;
  }
    return berat;
  }

  void tambahMuatan (Hewan hewan){
    if (totalMuatan() + hewan.beratHewan <= kapasitas){
      muatan.add(hewan);
    }
    else{
      print('muatan penuh');
    }
  }
}

void main(){
  Mobil mobil = Mobil(kapasitas: 100);
  Hewan kambing = Hewan(namaHewan: "kambing", beratHewan: 25);
  Hewan sapi = Hewan(namaHewan: "Sapi", beratHewan: 50);

  mobil.tambahMuatan(kambing);
  mobil.tambahMuatan(sapi);
  print("total muatan adalah ${mobil.totalMuatan()} kg");

}