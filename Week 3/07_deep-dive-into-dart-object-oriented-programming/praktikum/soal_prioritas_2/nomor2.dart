import 'nomor1.dart';

void main(){
  int x = 12;
  int y = 18;
  KelipatanPersekutuanTerkecil operationkpk = KelipatanPersekutuanTerkecil(x: x, y: y);
  KelipatanPersekutuanTerbesar operationfpb = KelipatanPersekutuanTerbesar(x: x, y: y);

  print("KPK = ${operationkpk.hasil()}");
  print("FPB = ${operationfpb.hasil()}");
}