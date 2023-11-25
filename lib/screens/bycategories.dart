import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'categories.dart';
import '/models/book.dart';
import 'detail.dart';

class BooksByCategoryScreen extends StatelessWidget {
  final String category;
  final String name;

  BooksByCategoryScreen({required this.category, required this.name});

  @override
  Widget build(BuildContext context) {
    // Implement logic to fetch books based on the selected category
    Future<List<Book>> booksForCategory = fetchBooksByCategory(category);

    return Scaffold(
      appBar: AppBar(
        title: Text('Books in ${name}'),
      ),
      body: FutureBuilder(
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
      return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          Book book = snapshot.data![index];
          return Card (
            child:ListTile(
            visualDensity: VisualDensity(vertical: 3),
            leading: Image.network(
              snapshot.data![index].images,
              // width: 50,
              height: 100, 
            ),
            title: Text(book.title),
            subtitle: Text(book.author),
            onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPage(book: snapshot.data![index]),),
            );},
          ),);
        },
      );
      }
      else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return const CircularProgressIndicator();},
          future: booksForCategory,
    ));
  }
  Future<List<Book>> fetchBooksByCategory(String category) async {
  final response = await http.get(Uri.parse('http://127.0.0.1:3000/books/?category_slug=$category'),);
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body) as List;
    return jsonResponse.map((top) => Book.fromJson(top)).toList();
  } else {
    throw Exception('Failed to load books');
  }
  }
}
