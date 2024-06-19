import 'package:flutter/material.dart';
import 'package:openbook/API/api_services.dart';
import 'package:openbook/API/model.dart';

class BookProvider with ChangeNotifier {
  ApiService _apiService = ApiService();
  List<Book> _books = [];
  bool _isLoading = false;

  List<Book> get books => _books;
  bool get isLoading => _isLoading;

  Future<void> fetchBooks() async {
    _isLoading = true;
    notifyListeners();

    try {
      _books = await _apiService.fetchBooks();
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
