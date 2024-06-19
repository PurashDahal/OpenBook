import 'package:flutter/material.dart';
import 'package:openbook/API/model.dart';

class FavoriteProvider with ChangeNotifier {
  List<Book> _favoriteBooks = [];

  List<Book> get favoriteBooks => _favoriteBooks;

  void toggleFavorite(Book book) {
    if (_favoriteBooks.contains(book)) {
      _favoriteBooks.remove(book);
      notifyListeners();
    } else {
      _favoriteBooks.add(book);
      notifyListeners();
    }
  }

  bool isFavorite(Book book) {
    return _favoriteBooks.contains(book);
  }
}
