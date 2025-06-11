import 'package:flutter/material.dart';

import '../order_success/order_success_page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final TextEditingController _addressController = TextEditingController();
  String _paymentMethod = 'Cash'; // default

  // 🛒 Replace with actual cart total from your cart logic
  int totalAmount = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 📬 Delivery Address
            const Text("Delivery Address", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                hintText: "Enter your full address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              maxLines: 3,
            ),

            const SizedBox(height: 20),

            // 💳 Payment Method
            const Text("Payment Method", style: TextStyle(fontSize: 18)),
            ListTile(
              title: const Text('Cash'),
              leading: Radio(
                value: 'Cash',
                groupValue: _paymentMethod,
                onChanged: (value) {
                  setState(() => _paymentMethod = value!);
                },
              ),
            ),
            ListTile(
              title: const Text('UPI'),
              leading: Radio(
                value: 'UPI',
                groupValue: _paymentMethod,
                onChanged: (value) {
                  setState(() => _paymentMethod = value!);
                },
              ),
            ),

            const SizedBox(height: 20),

            // 💰 Order Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total:', style: TextStyle(fontSize: 20)),
                Text('₹$totalAmount',
                    style: const TextStyle(fontSize: 20, color: Colors.pink)),
              ],
            ),

            const Spacer(),

            // ✅ Place Order Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const OrderSuccessPage()),
                  );
                },

                icon: const Icon(Icons.check_circle_outline),
                label: const Text("Place Order"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
