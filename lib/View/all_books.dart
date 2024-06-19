import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:openbook/API/model.dart';
import 'package:openbook/StateManagement/favorite_provider.dart';
import 'package:openbook/StateManagement/providers.dart';
import 'package:openbook/View/book_details.dart';
import 'package:openbook/View/book_search_delegate.dart';
import 'package:provider/provider.dart';

class AllBooksScreen extends StatefulWidget {
  @override
  _AllBooksScreenState createState() => _AllBooksScreenState();
}

class _AllBooksScreenState extends State<AllBooksScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Books",
          style: GoogleFonts.adamina(
            textStyle: TextStyle(fontSize: 24),
          ),
        ),
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 60, 54, 244),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: BookSearchDelegate(
                  Provider.of<BookProvider>(context, listen: false).books,
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<BookProvider>(
        builder: (context, bookProvider, child) {
          if (bookProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (bookProvider.books.isEmpty) {
            return Center(child: Text('No data'));
          } else {
            // Filter books based on the search query
            List<Book> filteredBooks = bookProvider.books
                .where((book) => book.name
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase()))
                .toList();

            return ListView.builder(
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                final book = filteredBooks[index];
                final String img = book.imglink.trim();
                final isFavorite =
                    context.watch<FavoriteProvider>().isFavorite(book);

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailsScreen(book: book),
                      ),
                    );
                  },
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 60, 54, 244),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(8.0),
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(img),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        book.name,
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          context.read<FavoriteProvider>().toggleFavorite(book);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                isFavorite
                                    ? 'Removed from favorites'
                                    : 'Added to favorites',
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
