class Cake {
  final String name;
  final int price;
  final String description;
  bool isFavorite;
  final double rating;
  final String size;
  final int? originalPrice;
  final List<String> imageUrls;
  final bool isEggless;
  final bool inStock;

  Cake({
    required this.name,
    required this.price,
    required this.imageUrls,
    required this.description,
    this.isFavorite = false,
    required this.rating,
    required this.size,
    this.originalPrice,
    required this.isEggless,
    required this.inStock
  });

  // ✅ Convert Map to Cake
  factory Cake.fromMap(Map<String, dynamic> map) {
    return Cake(
      name: map['name'] ?? '',
      price: map['price'] ?? 0,
      imageUrls: List<String>.from(map['imageUrls'] ?? []), // ✅ fixed
      description: map['description'] ?? '',
      isFavorite: map['isFavorite'] ?? false,
      rating: map['rating'] ?? 0.0,
      size: map['size'] ?? '',
      originalPrice: map['originalPrice'],
      isEggless: map['isEggless'] ?? false,
      inStock: map['inStock'] ?? false,
    );
  }

  // ✅ Convert Cake to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'imageUrls': imageUrls,
      'description': description,
      'isFavorite': isFavorite,
      'rating': rating,
      'size': size,
      'originalPrice': originalPrice,
    };
  }
}
