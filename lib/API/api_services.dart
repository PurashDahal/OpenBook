// services/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:openbook/API/model.dart';

class ApiService {
  final List<String> apiUrls = [
    for (int i = 101; i <= 200; i++) "http://192.168.1.70:4999/api/things/$i"
  ];

  Future<List<Book>> fetchBooks() async {
    List<Book> books = [];

    for (String url in apiUrls) {
      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          books.add(Book.fromJson(json.decode(response.body)));
        } else {
          print('Failed to load book from $url');
        }
      } catch (e) {
        print('Exception when loading book from $url: $e');
      }
    }

    return books;
  }
}
