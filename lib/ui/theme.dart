import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '';

import 'package:nw_trader/constants/ui_constants.dart';

class Themes {
  static final light = ThemeData(
    primaryColor: primaryColor,
    brightness: Brightness.light,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );

  static final dark = ThemeData(
    primaryColor: secondaryColor,
    brightness: Brightness.dark,
  );
}
