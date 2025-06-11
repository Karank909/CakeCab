import 'package:flutter/material.dart';
import '../../models/cake.dart';

class CakeDetailPage extends StatefulWidget {
  final Cake cake;

  const CakeDetailPage({super.key, required this.cake});

  @override
  State<CakeDetailPage> createState() => _CakeDetailPageState();
}

class _CakeDetailPageState extends State<CakeDetailPage> {
  int quantity = 1;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.cake.isFavorite;
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      widget.cake.isFavorite = isFavorite; // optional: persist locally
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cake.name),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🍰 Image with Favorite Toggle
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: widget.cake.imageUrl,
                    child: Image.asset(
                      widget.cake.imageUrl,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: GestureDetector(
                    onTap: toggleFavorite,
                    child: Container(
                      height: 30,
                      width: 30,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.pinkAccent,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 📝 Cake Name
            Text(
              widget.cake.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // 💸 Price
            Text(
              '₹${widget.cake.price}',
              style: const TextStyle(fontSize: 20, color: Colors.pink),
            ),

            const SizedBox(height: 16),

            // 📃 Description
            Text(
              widget.cake.description,
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),

            const SizedBox(height: 16),

            // Price + Quantity Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('₹${widget.cake.price}',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),

                // Quantity Buttons
              ],
            ),

            const SizedBox(height: 20),

            // Add to Cart Button
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add to cart logic
                    },
                    child: Text("Add to Cart"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade100,
                      foregroundColor: Colors.pink.shade900,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Direct checkout with this item
                    },
                    child: Text("Order Now"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
