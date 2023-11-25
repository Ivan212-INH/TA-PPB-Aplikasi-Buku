import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '/models/book.dart';
import '/providers/bookprovider.dart';
import 'detail.dart';

class BookListPage extends StatefulWidget {
    const BookListPage({Key? key}) : super(key: key);
  @override
  BookListState createState() => BookListState();
}

class BookListState extends State<BookListPage> {
  TextEditingController _controller = TextEditingController();
   late Future<List<Book>> books; 
   
  @override
  void initState() {
    super.initState();
    books = _fetchBooks();
  }


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book List'),
      ),
      body: SingleChildScrollView(
      child: Column (
        children: [ 
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card (
                  child: ListTile(
                  visualDensity: VisualDensity(vertical: 3),
                  leading: Image.network(
                    snapshot.data![index].images,
                    // width: 100, 
                    height: 100, 
                  ),
                  title: Text(snapshot.data![index].title),
                  subtitle: Text(snapshot.data![index].author),
                  onTap: () { Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPage(book: snapshot.data![index]),),
                  );},
                  // display other information here
            ),);
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
        return const CircularProgressIndicator();},
      future: books),
          ),
          
    ]))
    );
  }
}

    Future<List<Book>> _fetchBooks() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:3000/books'),);
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body) as List;
    return jsonResponse.map((books) => Book.fromJson(books)).toList();
  } else {
    throw Exception('Failed to load books');
  }
}