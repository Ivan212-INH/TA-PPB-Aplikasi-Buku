import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/booklist.dart';
import 'screens/favorite.dart';
import 'screens/detail.dart';
import 'models/book.dart';
import 'screens/profile.dart';

void main() async{
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key : key);
 @override
    Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime app',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/detail': (context) => DetailPage(book: Book.empty()),
        '/booklist': (context) => const BookListPage(),
        '/favorite': (context) => FavoritePage(),
        '/profile': (context) => ProfilePage(),
      },
      theme: ThemeData(
    useMaterial3: true,

    // Define the default brightness and colors.
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color.fromARGB(255, 251, 241, 199),
      // ···
      brightness: Brightness.dark,
    ),
  ),
    );
  }
}