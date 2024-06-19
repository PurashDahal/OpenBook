import 'package:flutter/material.dart';
// import 'package:gif_view/gif_view.dart';
// import 'package:flutter_gif/flutter_gif.dart';
import 'package:gif/gif.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:openbook/View/main_page.dart';
import 'package:openbook/View/tick_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late final GifController controller;
  @override
  void initState() {
    super.initState();
    controller = GifController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    void loginScreen() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BookScreen()));
    }

    return Scaffold(
      backgroundColor: Color(0xFFf5f5f7),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: mq.height * 0.01, left: 25, right: 25),
        child: SizedBox(
          height: mq.height * 0.06,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 60, 54, 244),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              loginScreen();
            },
            child: Text(
              'LOGIN',
              style: GoogleFonts.getFont(
                'Lato',
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        height: mq.height,
        width: mq.width,
        margin: const EdgeInsets.only(left: 25, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   margin:
            //       EdgeInsets.only(left: mq.width * 0.14, top: mq.height * 0.04),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Image.asset(
            //         "assets/book.png",
            //         height: 50,
            //       ),
            //       SizedBox(
            //         width: 20,
            //       ),
            //       Text(
            //         "Open Book",
            //         style: GoogleFonts.changa(
            //           textStyle: TextStyle(color: Colors.black, fontSize: 34),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 120,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 13,
                      bottom: 8,
                    ),
                    child: Text(
                      'Login ID',
                      style: GoogleFonts.getFont(
                        'Lato',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mq.height * 0.06,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 13,
                      bottom: 8,
                    ),
                    child: Text(
                      'Password',
                      style: GoogleFonts.getFont('Lato',
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: mq.height * 0.06,
                    child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TickWidget(),
                    Text(
                      'Remember me?',
                      style: GoogleFonts.getFont('Lato'),
                    )
                  ],
                ),
                // TextButton(
                //   onPressed: () {
                //     forgotPassword();
                //   },
                //   child: Text(
                //     'Forgot Password?',
                //     style: GoogleFonts.getFont('Lato',
                //         fontSize: 12,
                //         color: primaryColor,
                //         fontWeight: FontWeight.bold),
                //   ),
                // )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Gif(
                  image: AssetImage('assets/gifs/login.gif'),
                  repeat: ImageRepeat.noRepeat,
                  autostart: Autostart.once,
                  controller: controller,
                  placeholder: (context) => const Text('Loading...'),
                  onFetchCompleted: () {
                    controller.reset();

                    controller.forward();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
