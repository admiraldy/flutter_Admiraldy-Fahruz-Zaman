import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextAppStyle {
  TextStyle m3headlinesmall = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );
  TextStyle m3labelLarge = GoogleFonts.roboto(
    fontSize: 14,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
  );
  TextStyle m3bodylarge = GoogleFonts.roboto(
    fontSize: 16,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w400,
  );
  TextStyle m3bodymedium = GoogleFonts.roboto(
    fontSize: 14,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w400,
  );
  TextStyle m3bodysmall = GoogleFonts.roboto(
    fontSize: 12,
    letterSpacing: 0.4,
    fontWeight: FontWeight.w400,
  );
}

class AppColor {
  Color surfaceVariant = const Color(0xffE7E0EC);
  Color lightPrimary = const Color(0xff6750A4);
  Color lightPrimaryContainer = const Color(0xffEADDFF);
  Color onPrimaryContainer = const Color(0xFF21005D);
}