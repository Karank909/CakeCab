import '../models/cake.dart';

final List<Cake> featuredCakes = [
  Cake(
    name: 'Choco Delight',
    price: 499,
    imageUrls: [
      'assets/images/ChocoCake1.png',
      'assets/images/ChocoCake1.png',
      'assets/images/ChocoCake1.png',
    ],
    description: "Indulge in the ultimate chocolate experience with our Choco Delight – a rich, moist, and fluffy chocolate sponge cake layered with smooth fudge frosting. Topped with chocolate shavings and a drizzle of dark ganache, its perfect for birthdays, celebrations",
    rating: 4.5,
    size: '2 pound',
    originalPrice: 600,
    isEggless: false,
    inStock: true,
  ),
  Cake(
    name: 'Choco Delight',
    price: 499,
    imageUrls: [
      'assets/images/ChocoCake1.png',
      'assets/images/ChocoCake1.png',
      'assets/images/ChocoCake1.png',
    ],
    description: "Indulge in the ultimate chocolate experience with our Choco Delight – a rich, moist, and fluffy chocolate sponge cake layered with smooth fudge frosting. Topped with chocolate shavings and a drizzle of dark ganache, its perfect for birthdays, celebrations",
    rating: 4.5,
    size: '2 pound',
    originalPrice: 600,
    isEggless: false,
    inStock: true,
  ),
  Cake(
    name: 'Choco Delight',
    price: 499,
    imageUrls: [
      'assets/images/ChocoCake1.png',
      'assets/images/ChocoCake1.png',
      'assets/images/ChocoCake1.png',
    ],
    description: "Indulge in the ultimate chocolate experience with our Choco Delight – a rich, moist, and fluffy chocolate sponge cake layered with smooth fudge frosting. Topped with chocolate shavings and a drizzle of dark ganache, its perfect for birthdays, celebrations",
    rating: 4.5,
    size: '2 pound',
    originalPrice: 600,
    isEggless: false,
    inStock: true,
  ),
  Cake(
    name: 'Choco Delight',
    price: 499,
    imageUrls: [
      'assets/images/ChocoCake1.png',
      'assets/images/ChocoCake1.png',
      'assets/images/ChocoCake1.png',
    ],
    description: "Indulge in the ultimate chocolate experience with our Choco Delight – a rich, moist, and fluffy chocolate sponge cake layered with smooth fudge frosting. Topped with chocolate shavings and a drizzle of dark ganache, its perfect for birthdays, celebrations",
    rating: 4.5,
    size: '2 pound',
    originalPrice: 600,
    isEggless: false,
    inStock: true,
  ),
  Cake(
    name: 'Choco Delight',
    price: 499,
    imageUrls: [
      'assets/images/ChocoCake1.png',
      'assets/images/ChocoCake1.png',
      'assets/images/ChocoCake1.png',
    ],
    description: "Indulge in the ultimate chocolate experience with our Choco Delight – a rich, moist, and fluffy chocolate sponge cake layered with smooth fudge frosting. Topped with chocolate shavings and a drizzle of dark ganache, its perfect for birthdays, celebrations",
    rating: 4.5,
    size: '2 pound',
    originalPrice: 600,
    isEggless: false,
    inStock: true,
  ),
  Cake(
    name: 'Choco Delight',
    price: 499,
    imageUrls: [
      'assets/images/ChocoCake1.png',
      'assets/images/ChocoCake1.png',
      'assets/images/ChocoCake1.png',
    ],
    description: "Indulge in the ultimate chocolate experience with our Choco Delight – a rich, moist, and fluffy chocolate sponge cake layered with smooth fudge frosting. Topped with chocolate shavings and a drizzle of dark ganache, its perfect for birthdays, celebrations",
    rating: 4.5,
    size: '2 pound',
    originalPrice: 600,
    isEggless: false,
    inStock: true,
  ),
  Cake(
    name: 'Choco Delight',
    price: 499,
    imageUrls: [
      'assets/images/ChocoCake1.png',
      'assets/images/ChocoCake1.png',
      'assets/images/ChocoCake1.png',
    ],
    description: "Indulge in the ultimate chocolate experience with our Choco Delight – a rich, moist, and fluffy chocolate sponge cake layered with smooth fudge frosting. Topped with chocolate shavings and a drizzle of dark ganache, its perfect for birthdays, celebrations",
    rating: 4.5,
    size: '2 pound',
    originalPrice: 600,
    isEggless: false,
    inStock: true,
  ),
  Cake(
    name: 'Strawberry Cream',
    price: 500,
    imageUrls: [
      'assets/images/Vanilla.png',
      'assets/images/Vanilla.png',
    ],
    description: 'Fresh strawberry layered cake',
    rating: 4.2,
    size: '1 pound',
    isEggless: true,
    inStock: false,
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

