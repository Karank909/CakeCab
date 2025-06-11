class CartItem {
  final String name;
  final int price;
  final int quantity;
  final String image;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
  });

  int get totalPrice => price * quantity;
}
