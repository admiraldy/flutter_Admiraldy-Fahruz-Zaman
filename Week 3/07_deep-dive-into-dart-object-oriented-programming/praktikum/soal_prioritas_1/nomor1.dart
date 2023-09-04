class BangunRuang{
  int panjang;
  int lebar;
  int tinggi;

  BangunRuang({required this.panjang, required this.lebar,required this.tinggi});

  int volume(){
    return panjang * lebar * tinggi;
  }
}

class Kubus extends BangunRuang{
  int sisi;

  Kubus({required this.sisi}) : super(panjang: sisi, lebar: sisi, tinggi: sisi);

  @override
  int volume(){
    return sisi * sisi * sisi;
  }
}

class Balok extends BangunRuang{
  int panjangBalok;
  int lebarBalok;
  int tinggiBalok;

  Balok({required this.panjangBalok, required this.lebarBalok, required this.tinggiBalok}) : super (panjang: panjangBalok, lebar: lebarBalok, tinggi: tinggiBalok);
}