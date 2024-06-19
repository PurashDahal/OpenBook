import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:openbook/API/model.dart';

class BookCarousel extends StatelessWidget {
  final List<Book> books;

  BookCarousel({required this.books});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.5,
          autoPlay: true,
          // viewportFraction: 1.0,
          enlargeCenterPage: true),
      items: books.map((book) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                book.imglink.trim(),
                fit: BoxFit.fill,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images.jpeg',
                    fit: BoxFit.fill,
                    width: double.infinity,
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
