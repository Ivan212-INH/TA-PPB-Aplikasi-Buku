import 'package:flutter/material.dart';
import 'booklist.dart';
import 'categories.dart';
import 'favorite.dart';
import 'profile.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key : key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
 @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: _showList(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        // type: BottomNavigationBarType.fixed,
        onDestinationSelected: (index) {setState(() {_selectedIndex = index;});},
        // onTap: (index) {setState(() {_selectedIndex = index;});},
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.book),
            label: 'Books',
          ),
          NavigationDestination(
            icon: Icon(Icons.book),
            label: 'Category',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.search),
          //   label: 'Search',
          // ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.search),
      //   onPressed: () {},
      //  ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }
  Widget _showList() {
    switch (_selectedIndex){
      case 0: return const BookListPage();
      case 1: return CategoryScreen();
      case 2: return FavoritePage();
      // case 2: return SearchPage();
      case 3: return ProfilePage();
      default:
      return(Text('invalid entry'));
    }
  }
}