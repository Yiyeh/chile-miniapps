import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextoAppBar extends StatelessWidget {
  
  final String texto;

  const TextoAppBar({Key key, this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
