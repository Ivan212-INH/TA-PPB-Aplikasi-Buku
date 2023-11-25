 class Category {
  final String name;
  final String slug;

  Category(
    {required this.name, 
    required this.slug
    });
}

 final List<Category> categories = [
    Category(name: 'Fiction', slug: 'fiction'),
    Category(name: 'Comic', slug: 'comic'),
    Category(name: 'Computer & Technology', slug: 'computer-technology'),
    Category(name: 'Motivation & Self Help', slug: 'motivation-self-help'),
    // Add more categories as needed
  ];