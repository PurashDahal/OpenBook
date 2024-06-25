import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:openbook/View/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  late final GifController controller;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = GifController(vsync: this);
  }

  Future<void> saveCredentials() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', emailController.text);
    await prefs.setString('password', passwordController.text);
  }

  void signUpScreen() async {
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    await saveCredentials();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Register successful'),
        backgroundColor: Colors.green,
      ),
    );
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  void navigateToLogin() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

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
            onPressed: signUpScreen,
            child: Text(
              'SIGN UP',
              style: GoogleFonts.getFont(
                'Lato',
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: mq.height,
          width: mq.width,
          margin: const EdgeInsets.only(left: 25, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/openBookLogo1.png",
                height: 160,
              ),
              SizedBox(
                height: 40,
              ),
              buildTextField(
                  'Name', nameController, TextInputType.name, false, mq),
              SizedBox(
                height: 15,
              ),
              buildTextField(
                  'Phone', phoneController, TextInputType.phone, false, mq),
              SizedBox(
                height: 15,
              ),
              buildTextField('Email', emailController,
                  TextInputType.emailAddress, false, mq),
              SizedBox(
                height: 15,
              ),
              buildTextField('Password', passwordController,
                  TextInputType.visiblePassword, true, mq),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 60, 54, 244),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              // Center(
              //   child: SizedBox(
              //     height: MediaQuery.of(context).size.height * 0.3,
              //     child: Gif(
              //       image: AssetImage('assets/gifs/login.gif'),
              //       repeat: ImageRepeat.noRepeat,
              //       autostart: Autostart.once,
              //       controller: controller,
              //       placeholder: (context) => const Text('Loading...'),
              //       onFetchCompleted: () {
              //         controller.reset();
              //         controller.forward();
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      TextInputType inputType, bool isPassword, Size mq) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 13,
              bottom: 8,
            ),
            child: Text(
              label,
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
              controller: controller,
              keyboardType: inputType,
              obscureText: isPassword,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
