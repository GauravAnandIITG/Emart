class Product{
  final String name;
  final String category;
  final String image;
  final String description;
  final double price;
  int quantity;
  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.image,
    required this.quantity,
});
  factory Product.fromMap(Map<String, dynamic> map){
    return Product(
        name: map["name"] ?? "",
        category: map["category"] ?? "",
        price: (map["price"] ?? "").toDouble(),
        description: map["description"] ?? "",
        image: map["image"] ?? "",
        quantity: (map["quantity"] ??"").toInt());
  }
}