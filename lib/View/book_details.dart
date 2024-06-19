import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:openbook/API/model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookDetailsScreen extends StatefulWidget {
  final Book book;

  BookDetailsScreen({required this.book});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            controller.runJavaScript('''
              document.body.style.margin = '10';
              document.body.style.padding = '10';
              document.body.style.boxSizing = 'border-box';
            ''');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.book.webver));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.book.name,
          style: GoogleFonts.adamina(
            textStyle: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 60, 54, 244),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
