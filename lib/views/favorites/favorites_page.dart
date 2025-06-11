import 'package:flutter/material.dart';
import '../../models/cake.dart';
import '../../widgets/cake_card.dart';

class FavoritesPage extends StatelessWidget {
  final List<Cake> allCakes;

  const FavoritesPage({super.key, required this.allCakes});

  @override
  Widget build(BuildContext context) {
    final favoriteCakes = allCakes.where((cake) => cake.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: favoriteCakes.isEmpty
          ? const Center(child: Text("No favorites yet! 💔"))
          : Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: favoriteCakes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return CakeCard(cake: favoriteCakes[index]);
          },
        ),
      ),
    );
  }
}
