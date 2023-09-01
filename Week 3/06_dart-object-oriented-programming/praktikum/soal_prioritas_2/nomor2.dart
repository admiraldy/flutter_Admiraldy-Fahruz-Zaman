class Course{
  String judul;
  String deskripsi;

  Course(this.judul, this.deskripsi);
}

class Student {
  String nama;
  String kelas;
  List<Course> daftarCourse = [];

  Student({required this.nama, required this.kelas});

  void menambahkanCourse(String judul, String deskripsi){
    daftarCourse.add(Course(judul, deskripsi));
  }

  void menghapusCourse(Course course){
    daftarCourse.remove(course);
  }

  void melihatCourse(){
    if(daftarCourse.isEmpty){
      print('tidak ada course');
    }
    else{
      print("Course yang terdaftar:");
      for(var i = 0; i < daftarCourse.length; i++){
        print('${i+1}. ${daftarCourse[i].judul}, ${daftarCourse[i].deskripsi}');
      }
    }
  }
}

void main(){
  Student student = Student(nama: "Admiraldy Fahruz Zaman", kelas: "Flutter A");

  print("nama: ${student.nama}");
  print("kelas: ${student.kelas}");

  student.menambahkanCourse("Basic Version and branch Management", "perkenalan penggunaan github");
  student.menambahkanCourse("Fundamental Dart", "perkenalan dan basic dari bahasa dart");
  student.menambahkanCourse("Fundamental Dart", "perkenalan dan basic dari bahasa dart");

  student.menghapusCourse(student.daftarCourse[2]);

  student.melihatCourse();
}