import 'package:flutter/material.dart';
import '../../models/cake.dart';
import '../checkout/checkout_page.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Temporary cart list
  List<Map<String, dynamic>> cartItems = [
    {
      'cake': Cake(
        name: 'Choco Delight',
        price: 500,
        imageUrl: 'assets/images/choco_cake.jpg',
        description: 'Rich chocolate cake',
        rating: 4.5,
        size: 'Medium',

      ),
      'quantity': 2,
    },
    {
      'cake': Cake(
        name: 'Strawberry Cream',
        price: 500,
        imageUrl: 'assets/images/strawberry_cake.jpg',
        description: 'Fluffy sponge with strawberry cream',
        rating: 4.2,
        size: 'Large',
      ),
      'quantity': 1,
    },
  ];

  int getTotalPrice() {
    return cartItems.fold<int>(0, (sum, item) {
      return sum + (item['cake'].price as int) * (item['quantity'] as int);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final cake = cartItems[index]['cake'] as Cake;
                final quantity = cartItems[index]['quantity'];

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        cake.imageUrl,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(cake.name),
                    subtitle: Text('₹${cake.price} x $quantity'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            if (quantity > 1) {
                              setState(() => cartItems[index]['quantity']--);
                            }
                          },
                        ),
                        Text('$quantity'),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline),
                          onPressed: () {
                            setState(() => cartItems[index]['quantity']++);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Total & Checkout
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total:',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '₹${getTotalPrice()}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CheckoutPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: const Text("Proceed to Checkout"),
                  ),

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
