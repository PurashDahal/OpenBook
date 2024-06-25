import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:openbook/View/all_books.dart';
import 'package:openbook/View/favorite_screen.dart';
import 'package:openbook/View/login.dart';
import 'package:openbook/View/login_status.dart';

class DrwaerWidget extends StatefulWidget {
  const DrwaerWidget({super.key});

  @override
  State<DrwaerWidget> createState() => _DrwaerWidgetState();
}

class _DrwaerWidgetState extends State<DrwaerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.44,
            child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Text(
                      "Open Book",
                      style: GoogleFonts.adamina(
                        textStyle: TextStyle(color: Colors.black, fontSize: 34),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      "assets/book.png",
                      fit: BoxFit.fitHeight,
                      height: MediaQuery.of(context).size.height * 0.27,
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 60, 54, 244),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18),
                    bottomRight: Radius.circular(18))),
            child: ListTile(
              leading: Icon(
                FontAwesomeIcons.book,
                color: Colors.white,
              ),
              title: Text(
                'All Books',
                style: GoogleFonts.adamina(
                  textStyle: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllBooksScreen(),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 60, 54, 244),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18),
                    bottomRight: Radius.circular(18))),
            child: ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              title: Text(
                'Favorites',
                style: GoogleFonts.adamina(
                  textStyle: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoriteScreen(),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 60, 54, 244),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18),
                    bottomRight: Radius.circular(18))),
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: Text(
                'Log out',
                style: GoogleFonts.adamina(
                  textStyle: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              onTap: () {
                LoginStatus.isLoggedIn = false;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
