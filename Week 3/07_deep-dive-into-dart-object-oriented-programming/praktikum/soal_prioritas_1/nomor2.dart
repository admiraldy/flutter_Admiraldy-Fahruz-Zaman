import 'nomor1.dart';

void main(){
  BangunRuang bangun = BangunRuang(panjang: 2, lebar: 3, tinggi: 10);
  Kubus kubus = Kubus(sisi: 4);
  Balok balok = Balok(panjangBalok: 4, lebarBalok: 5, tinggiBalok: 3);

  print(bangun.volume());
  print(kubus.volume());
  print(balok.volume());
}