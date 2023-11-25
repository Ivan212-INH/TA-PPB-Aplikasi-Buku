import 'package:flutter/material.dart';
import 'booklist.dart';
import 'detail.dart';

import '/models/book.dart';

class FavoritePage extends StatelessWidget {
  static final List<Book> favoriteBooks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Books'),
      ),
      body: ListView.builder(
        itemCount: favoriteBooks.length,
        itemBuilder: (context, index) {
          return Card (
            child:ListTile(
            visualDensity: VisualDensity(vertical: 3),
            leading: Image.network(
              favoriteBooks[index].images, // Replace with the actual field in your JSON for the image URL
              // width: 50, // Adjust the width as needed
              height: 100, // Adjust the height as needed
            ),
            title: Text(favoriteBooks[index].title),
            subtitle: Text(favoriteBooks[index].author),
            onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPage(book: favoriteBooks[index]),),
            );},
            // ... other details
          ),);
        },
      ),
    );
  }
}
