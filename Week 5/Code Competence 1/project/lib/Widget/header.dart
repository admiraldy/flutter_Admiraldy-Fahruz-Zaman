import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.asset('assets/images/cover.jpeg').image,
          fit: BoxFit.cover
        ),
      ),
      child: const SizedBox(
        height: 780,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'TRAVIS',
                style: TextStyle(
                  fontFamily: 'Bristone',
                  color: Colors.white,
                  fontSize: 60,
                  height: 0.8
                ),
              ),
              Text(
                'SCOTT',
                style: TextStyle(
                  fontFamily: 'Bristone',
                  color: Colors.white,
                  fontSize: 60,
                  height: 1
                ),
              ),
              Text(
                'UTOPIA',
                style: TextStyle(
                  fontFamily: 'Bristone',
                  color: Colors.redAccent,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}