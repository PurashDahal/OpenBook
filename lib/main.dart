import 'package:flutter/material.dart';
import 'package:openbook/StateManagement/favorite_provider.dart';
import 'package:openbook/StateManagement/providers.dart';

import 'package:openbook/View/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Open Book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookScreen(),
    );
  }
}
