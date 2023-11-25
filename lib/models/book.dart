class Book {  
  final int id;
  final String title;
  final String author;
  final String description;
  final String release_date;
  final String publisher;
  final int page_count;
  final String category;
  final String category_slug;
  bool isFavorite;
  final String images;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.release_date,
    required this.publisher,
    required this.page_count,
    required this.category,
    required this.category_slug,
    required this.images,
    this.isFavorite = false,
  });
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      description: json['description'],
      release_date: json['release_date'],
      publisher: json['publisher'],
      page_count: json['page_count'],
      category: json['category'],
      category_slug: json['category_slug'],
      isFavorite: false,
      images: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'author': author,
    'release_date': release_date,
    'publisher': publisher,
    'page_count': page_count,
    'category': category,
    'category_slug': category_slug,
    'description': description,
    'images': images,
  };

  static empty() {}
}
