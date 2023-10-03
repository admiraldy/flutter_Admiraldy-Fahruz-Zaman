import 'package:flutter/material.dart';
import 'package:praktikum/model/image.dart';
import 'package:praktikum/page/detail_page.dart';
import 'package:praktikum/widget/drawer.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      drawer: const DrawerWidget(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              showModalBottomSheet(
                context: context,
                builder: (context){
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(images[index]),
                      ElevatedButton(
                        child: Text('show details'),
                        onPressed: (){
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text('are you sure?'),
                                actions: [
                                  TextButton(
                                    child: Text('No'),
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text('Yes'),
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => DetailPage(image: images[index])
                                        )
                                      );
                                    },
                                  )
                                ],
                              );
                            }
                          );
                        },
                      )
                    ],
                  );
                }
              );
            },
            child: Image.asset(images[index]),
          );
        },
      ),
    );
  }
}