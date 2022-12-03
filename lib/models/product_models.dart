class ProductModel {
  final int id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String nameImage;
  final String pathImage;
  final String? rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.nameImage,
    required this.pathImage,
    this.rating,
  });
}
