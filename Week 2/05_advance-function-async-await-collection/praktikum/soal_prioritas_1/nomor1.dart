void main() async{
  List data = [1, 2, 3, 10];
  int pengali = 2;
  List hasil = await fungsiAsynchronous(data, pengali);
  print(hasil);
}

Future<List<int>>  fungsiAsynchronous(List data, int pengali) async{
  List<int> hasil = [];

  for(int i = 0; i <= data.length - 1; i++){
    int elemenData = data[i];
    int pengaliElemen = elemenData * pengali;
    hasil.add(pengaliElemen);

    await Future.delayed(Duration(seconds: 1));
  }
  return hasil;
}