void main(){

// define sisi, panjang, dan luas dr persegi & persegi panjang
  double sisiPersegi = 20;
  double panjangPPanjang = 40;
  double lebarPPanjang = 20;

// rumus luas dan keliling persegi
  double luasPersegi = sisiPersegi * sisiPersegi;
  double kelilingPersegi = sisiPersegi * 4;

// rumus luas dan keliling persegi panjang
  double luasPPanjang = panjangPPanjang * lebarPPanjang;
  double kelilingPPanjang = 2 * (panjangPPanjang * lebarPPanjang);

// show output
  print("luas dan keliling persegi adalah $luasPersegi & $kelilingPersegi");
  print("luas dan keliling persegi panjang adalah $luasPPanjang & $kelilingPPanjang");
}