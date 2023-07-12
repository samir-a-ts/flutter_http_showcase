class ProductData {
  final String title;

  final String description;

  final String category;

  const ProductData({
    required this.title,
    required this.description,
    required this.category,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'category': category,
      };
}

class Product extends ProductData {
  final int id;

  const Product({
    required this.id,
    required super.title,
    required super.category,
    required super.description,
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        super(
          category: json['category'],
          description: json['description'],
          title: json['title'],
        );
}
