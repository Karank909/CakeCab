import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/sample_data.dart'; // for formatting dates

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mockOrders.length,
        itemBuilder: (context, index) {
          final order = mockOrders[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  order.imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(order.name),
              subtitle: Text(
                'Qty: ${order.quantity} | ₹${order.totalPrice}\n${DateFormat.yMMMd().format(order.orderDate)}',
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
