import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Open Book",
          style: GoogleFonts.adamina(
            textStyle: TextStyle(fontSize: 24),
          ),
        ),
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      drawer: Drawer(
        child: Container(),
      ),
    );
  }
}
