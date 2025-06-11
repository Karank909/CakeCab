import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../models/cake.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import '../../models/cart_item.dart';


class CakeDetailPage extends StatefulWidget {
  final Cake cake;

  const CakeDetailPage({super.key, required this.cake});

  @override
  State<CakeDetailPage> createState() => _CakeDetailPageState();
}

class _CakeDetailPageState extends State<CakeDetailPage> {
  int _currentImageIndex = 0;
  late final PageController _pageController;

  int quantity = 1;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.cake.isFavorite;
    _pageController = PageController();
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      widget.cake.isFavorite = isFavorite;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cake = widget.cake;

    return Scaffold(
      appBar: AppBar(
        title: Text(cake.name),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🍰 Image Slider
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        itemCount: cake.imageUrls.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentImageIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              cake.imageUrls[index],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          );
                        },
                      ),

                      // ❤️ Favorite button
                      Positioned(
                        top: 12,
                        right: 12,
                        child: GestureDetector(
                          onTap: toggleFavorite,
                          child: Container(
                            height: 35,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.pinkAccent,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // 🔘 Dot indicator
                      Positioned(
                        bottom: 16,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: SmoothPageIndicator(
                            controller: _pageController,
                            count: cake.imageUrls.length,
                            effect: WormEffect(
                              activeDotColor: Colors.pink,
                              dotColor: Colors.pink.shade100,
                              dotHeight: 8,
                              dotWidth: 8,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 🧁 Cake Name
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🍳 Egg/Eggless Tag (above name)
                // 🍳 Egg Tag with Icon – Above Cake Name
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: cake.isEggless ? Colors.green[100] : Colors.orange[100],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            cake.isEggless ? Icons.eco : Icons.egg,
                            size: 16,
                            color: cake.isEggless ? Colors.green[800] : Colors.orange[800],
                          ),
                          const SizedBox(width: 6),
                          Text(
                            cake.isEggless ? 'Eggless' : 'Contains Egg',
                            style: TextStyle(
                              fontSize: 12,
                              color: cake.isEggless ? Colors.green[800] : Colors.orange[800],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // 🧁 Name and ⭐ Rating
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      cake.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      cake.rating.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.star,
                      size: 18,
                      color: Colors.green,
                    ),
                  ],
                ),
                // 📏 Size
                Text(
                  '${cake.size}',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),

            // 💰 Price
            Row(
              children: [
                // 💰 Discounted Price
                Text(
                  '₹${cake.price}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 10),

                // 🏷️ Original Price (if available)
                if (cake.originalPrice != null)
                  Text(
                    '₹${cake.originalPrice}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
              ],
            ),

                Text(
                  'Delivery in 30–45 min',
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.grey[500]),
                ),

            const SizedBox(height: 16),

            Text("Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            // 📄 Description
            Text(
              cake.description,
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),

            const SizedBox(height: 20),

          ],
        ),
      ),
      // ✅ Fixed Buttons
      // 🛒 Add to Cart + Order Now
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ❌ Out of stock warning
            if (!cake.inStock)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'This cake is currently out of stock.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red[700],
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

            // 🛒 Buttons in a row
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: cake.inStock
                        ? () {
                      final exists = Provider.of<CartProvider>(context, listen: false)
                          .items
                          .any((item) => item.name == cake.name);

                      if (exists) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${cake.name} is already in your cart.'),
                          ),
                        );
                      } else {
                        final cartItem = CartItem(
                          name: cake.name,
                          price: cake.price,
                          quantity: 1,
                          image: cake.imageUrls.first,
                        );

                        Provider.of<CartProvider>(context, listen: false).addItem(cartItem);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${cake.name} added to cart'),
                          ),
                        );
                      }
                    }
                        : null,
                    // Disabled if out of stock
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade100,
                      foregroundColor: Colors.pink.shade900,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text('Add to Cart'),
                  ),
                ),

                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: cake.inStock ? () {
                      // Order now logic
                    } : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text('Order Now'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),


    );
  }
}
