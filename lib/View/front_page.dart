import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:openbook/View/main_page.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                child: Image.asset(
                  "assets/book.png",
                  scale: 2,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Open Book",
              style: GoogleFonts.adamina(
                textStyle: TextStyle(color: Colors.black, fontSize: 34),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BookScreen();
              })),
              child: Container(
                padding: EdgeInsets.all(12),
                color: Colors.purple,
                child: Text(
                  "EXPLORE",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }
}
