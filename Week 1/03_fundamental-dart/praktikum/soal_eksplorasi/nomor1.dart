void main() {
  String word = "kasur rusak";
  int length = word.length;
  int iterationLength = length - 1;
  bool isPalindrom = false;

  for (var i = 0; i < length / 2; i++) {
    if (word[i] == word[iterationLength - i]) {
      isPalindrom = true;
    } else {
      isPalindrom = false;
      break;
    }
  }

  if (isPalindrom) {
    print("kata $word adalah palindrom");
  } else {
    print("kata $word bukan palindrom");
  }
}
