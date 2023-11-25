import 'package:flutter/material.dart';
import 'bycategories.dart';
import 'package:tugas_akhir_ppb/models/categoryList.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
            title: Text(categories[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BooksByCategoryScreen(category: categories[index].slug, name: categories[index].name,),
                ),
              );
            },
          ),);
        },
      ),
    );
  }
}
