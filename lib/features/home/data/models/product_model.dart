class ProductModel {
  final int id;
  final String title;
  final int price;
  final String description;
  final String image;
  final String category;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      image: (json['images'] as List).isNotEmpty
          ? json['images'][0]
          : '', // أول صورة
      category: json['category']?['name'] ?? '',
    );
  }
}
