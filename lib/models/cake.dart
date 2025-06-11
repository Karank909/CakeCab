class Cake {
  final String name;
  final int price;
  final String imageUrl;
  final String description;
  bool isFavorite;
  final double rating;
  final String size;
  final int? originalPrice;

  Cake({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    this.isFavorite = false,
    required this.rating,
    required this.size,
    this.originalPrice,
  });

  // Convert Map to Cake
  factory Cake.fromMap(Map<String, dynamic> map) {
    return Cake(
      name: map['name'] ?? '',
      price: map['price'] ?? 0,
      imageUrl: map['imageUrl'] ?? '',
      description: map['description'] ?? '',
      isFavorite: map['isFavorite'] ?? false,
      rating: map['rating'] ?? 0.0,
      size: map['size'] ?? '',
      originalPrice: map['originalPrice'],
    );
  }

  // Convert Cake to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
    };
  }
}
