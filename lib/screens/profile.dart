import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/profile-picture.jpg', ),
            ),
            Text('Ivan Nabil Haidar', 
            style: Theme.of(context).textTheme.titleMedium),
            Text('Github Link: https://github.com/Ivan212-INH/TA-PPB-Aplikasi-Buku', 
            style: Theme.of(context).textTheme.labelLarge),
            Padding(padding: EdgeInsets.all(20),
            child: Text('Aplikasi ini adalah aplikasi untuk menampilkan list buku. Aplikasi dapat memfavoritkan buku, atau menampilkan buku berdasarkan kategorinya', 
            style: Theme.of(context).textTheme.bodyMedium),
            ),
          ]
        ),
      )
    );
  }
}