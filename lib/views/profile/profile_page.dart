import 'package:flutter/material.dart';
import '../../models/cake.dart';
import '../favorites/favorites_page.dart';
import 'package:cakecab/models/sample_data.dart'; // wherever your sample list is


class ProfilePage extends StatelessWidget {
  final List<Cake> allCakes;
  const ProfilePage({super.key, required this.allCakes});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // 👤 Profile Picture
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/user.png'), // Add your image
              ),
              const SizedBox(height: 16),
        
              // 👤 Name
              const Text(
                "Cake Lover",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
        
              const SizedBox(height: 8),
        
              // 📧 Email (static for now)
              const Text(
                "cakey@example.com",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
        
              const SizedBox(height: 30),
        
              // ✏️ Edit Button (placeholder)
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FavoritesPage(allCakes: allCakes),
                    ),
                  );
                },
                icon: const Icon(Icons.favorite_border),
                label: const Text("Favorites"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
        
        
              const SizedBox(height: 12),
        
              // 🚪 Logout Button (placeholder)
              TextButton.icon(
                onPressed: () {
                  // Future: Add logout logic
                },
                icon: const Icon(Icons.logout, color: Colors.pink),
                label: const Text("Logout", style: TextStyle(color: Colors.pink)),
              ),
            ],
          ),
        ),
      ),


    );
  }
}
