  import 'package:http/http.dart' as http;
  import 'dart:convert';
  import '/models/book.dart';
  
  Future<List<Book>> fetchBooks() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:3000/books'),);
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body) as List;
    return jsonResponse.map((top) => Book.fromJson(top)).toList();
  } else {
    throw Exception('Failed to load books');
  }
}