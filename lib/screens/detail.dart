import 'package:flutter/material.dart';
import 'booklist.dart';
import 'favorite.dart';

import 'package:tugas_akhir_ppb/models/book.dart';

class DetailPage extends StatefulWidget {
  final Book book;
  const DetailPage({Key? key, required this.book}): super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
    bool isFavorited = false;

  @override
  void initState() {
    super.initState();
        // Set the initial state of the icon based on the book's isFavorited property
    isFavorited = FavoritePage.favoriteBooks.any((favoriteBook) => favoriteBook.id == widget.book.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.book.title),),
      body: SingleChildScrollView(
        child:Column(
          children: [
            Image.network(
              widget.book.images,
              // width: 200,
              height: 300,
            ),
            SizedBox(height: 20),
            Text(widget.book.title,textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleLarge),
            Text(widget.book.author,textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleMedium),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('Publisher:',textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium,),
                      Text(widget.book.publisher,textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall),
                      Text('Category:',textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium,),
                      Text(widget.book.category,textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text('Release Date:',textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium,),
                      Text(widget.book.release_date,textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall),
                      Text('Page Count:',textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium,),
                      Text(widget.book.page_count.toString(),textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ],
            ),
            Padding(padding: const EdgeInsets.all(20),
            child: Text(widget.book.description,textAlign: TextAlign.justify, style: Theme.of(context).textTheme.bodyMedium),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isFavorited = !isFavorited;
            if (isFavorited) {
              FavoritePage.favoriteBooks.add(widget.book);
            } else {
              FavoritePage.favoriteBooks.removeWhere((favoriteBook) => favoriteBook.id == widget.book.id);
            }
          });
        },
        child: Icon(isFavorited ? Icons.favorite : Icons.favorite_border),
      ),
    );
  }
}
