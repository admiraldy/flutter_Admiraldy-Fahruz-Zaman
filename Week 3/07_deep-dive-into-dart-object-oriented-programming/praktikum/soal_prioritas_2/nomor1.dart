class Matematika {
  int hasil() {
    return 0;
  }
}

class KelipatanPersekutuanTerkecil implements Matematika {
  int x;
  int y;

  KelipatanPersekutuanTerkecil({required this.x, required this.y});

  @override
  int hasil() {
    int a = x;
    int b = y;

    while (b != 0) {
      int nilaiSementara = b;
      b = a % b;
      a = nilaiSementara;
    }

    int fpb = a;
    int kpk = (x * y) ~/ fpb;
    return kpk;
  }
}

class KelipatanPersekutuanTerbesar implements Matematika {
  int x;
  int y;

  KelipatanPersekutuanTerbesar({required this.x, required this.y});

  @override
  int hasil() {
    int a = x;
    int b = y;

    while (b != 0) {
      int nilaiSementara = b;
      b = a % b;
      a = nilaiSementara;
    }

    int fpb = a;
    return fpb;
  }
}
