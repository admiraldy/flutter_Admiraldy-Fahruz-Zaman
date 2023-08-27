void main(){
  int rows = 8;
  for (int i = 1; i <= rows; i++) {
  String pattern = '';
    int xy = (i*2)-1;
    for (int j = rows - i; j >= 1; j--) {
      pattern += '  ';
    }
      pattern += '* ' * xy;
      print(pattern);
  }
}
