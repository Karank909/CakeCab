import '../models/cake.dart';

final List<Cake> featuredCakes = [
  Cake(
    name: 'Choco Delight',
    price: 499,
    imageUrl: 'assets/images/ChocoCake1.png',
    description: 'Delicious rich chocolate cake',
    rating: 4.5,
    size: '2 pound',
    originalPrice: 600,
  ),
  Cake(
    name: 'Strawberry Cream',
    price: 500,
    imageUrl: 'assets/images/Vanilla.png',
    description: 'Fresh strawberry layered cake',
    rating: 4.2,
    size: '1 pound',
  ),
  Cake(
    name: 'Pineapple Cake',
    price: 400,
    imageUrl: 'assets/images/pineapple.png',
    description: 'Classic pineapple sponge cake',
    rating: 4.8,
    size: '1 pound',
  ),
  Cake(
    name: 'Choco Delight',
    price: 500,
    imageUrl: 'assets/images/ChocoCake1.png',
    description: 'Delicious rich chocolate cake',
    rating: 4.5,
    size: '1 pound',
  ),
  Cake(
    name: 'Strawberry Cream',
    price: 500,
    imageUrl: 'assets/images/ChocoCake1.png',
    description: 'Fresh strawberry layered cake',
    rating: 4.2,
    size: '1 pound',
  ),
  Cake(
    name: 'Pineapple Cake',
    price: 400,
    imageUrl: 'assets/images/ChocoCake1.png',
    description: 'Classic pineapple sponge cake',
    rating: 4.8,
    size: '1 pound',
  ),
  Cake(
    name: 'Choco Delight',
    price: 500,
    imageUrl: 'assets/images/ChocoCake1.png',
    description: 'Delicious rich chocolate cake',
    rating: 4.5,
    size: '1 pound',
  ),
  Cake(
    name: 'Strawberry Cream',
    price: 500,
    imageUrl: 'assets/images/ChocoCake1.png',
    description: 'Fresh strawberry layered cake',
    rating: 4.2,
    size: '1 pound',
  ),
  Cake(
    name: 'Pineapple Cake',
    price: 400,
    imageUrl: 'assets/images/ChocoCake1.png',
    description: 'Classic pineapple sponge cake',
    rating: 4.8,
    size: '1 pound',
  ),
  Cake(
    name: 'Choco Delight',
    price: 500,
    imageUrl: 'assets/images/ChocoCake1.png',
    description: 'Delicious rich chocolate cake',
    rating: 4.5,
    size: '1 pound',
  ),
  Cake(
    name: 'Strawberry Cream',
    price: 500,
    imageUrl: 'assets/images/ChocoCake1.png',
    description: 'Fresh strawberry layered cake',
    rating: 4.2,
    size: '1 pound',
  ),
  Cake(
    name: 'Pineapple Cake',
    price: 400,
    imageUrl: 'assets/images/ChocoCake1.png',
    description: 'Classic pineapple sponge cake',
    rating: 4.8,
    size: '1 pound',

  ),
];

class Order {
  final String name;
  final String imageUrl;
  final int quantity;
  final int totalPrice;
  final DateTime orderDate;

  Order({
    required this.name,
    required this.imageUrl,
    required this.quantity,
    required this.totalPrice,
    required this.orderDate,
  });
}

final List<Order> mockOrders = [
  Order(
    name: 'Choco Delight',
    imageUrl: 'assets/images/choco_cake.jpg',
    quantity: 1,
    totalPrice: 500,
    orderDate: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Order(
    name: 'Strawberry Cream',
    imageUrl: 'assets/images/strawberry_cake.jpg',
    quantity: 2,
    totalPrice: 1000,
    orderDate: DateTime.now().subtract(const Duration(days: 3)),
  ),
];

