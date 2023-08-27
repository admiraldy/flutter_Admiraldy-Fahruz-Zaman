void main(){
  List nama = [
    ["kanye", "west"],
    ["young", "thug"],
    ["playboi", "carti"]
  ];

  Map mapping = {};
  for(int i = 0; i < nama.length; i++){
    String key = "artist ${i+1}";
    Map subElement = {
      "first name": nama[i][0],
      "last name": nama[i][1],
    };
    mapping[key] = subElement;
  }

  print(mapping);
}