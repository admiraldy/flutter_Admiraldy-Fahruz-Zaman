void main(){
  int rows = 6;
  for (int i = rows; i >= 2; i--) {
  String pattern = '';
    int xy = (i*2)-1;
    for (int j = rows - i; j >= 1; j--) {
      pattern += '  ';
    }
      pattern += '0 ' * xy;
      print(pattern);
  }
  for (int i = 1; i <= rows; i++) {
  String pattern = '';
    int xy = (i*2)-1;
    for (int j = rows - i; j >= 1; j--) {
      pattern += '  ';
    }
      pattern += '0 ' * xy;
      print(pattern);
  }
}
