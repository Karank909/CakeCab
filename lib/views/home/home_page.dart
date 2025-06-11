import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cakecab/widgets/cake_card.dart';
import 'package:cakecab/models/sample_data.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse && _showSearch) {
        setState(() {
          _showSearch = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool _showSearch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0), // Set scaffold background here
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF3E0), // Solid pastel background
        elevation: 0,
        title: Text(
          'CakeCab',
          style: GoogleFonts.pacifico(
            color: Color(0xFF6D4C41),
            fontSize: 26,

          ),
        ),
        centerTitle: false,
        actions: [
          if (!_showSearch)
            Container(
              child: IconButton(
                icon: Icon(Icons.search, color: Colors.pinkAccent),
                onPressed: () {
                  setState(() {
                    _showSearch = true;
                  });
                },
              ),
            ),

          IconButton(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart_outlined, color: Colors.pinkAccent),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${Provider.of<CartProvider>(context).items.length}',
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),

                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.pinkAccent),
            onPressed: () {},
          ),
        ],
      ),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔍 Search
                AnimatedSize(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                    opacity: _showSearch ? 1 : 0,
                    duration: Duration(milliseconds: 300),
                    child: _showSearch
                        ? Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.search, color: Colors.pinkAccent),
                            hintText: 'Search for cakes...',
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    )
                        : SizedBox.shrink(),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Featured Cakes",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // 🧁 Cake Grid
                Expanded(
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: _scrollController,
                      padding: const EdgeInsets.all(8),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery
                            .of(context)
                            .orientation == Orientation.portrait ? 2 : 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: featuredCakes.length,
                      itemBuilder: (context, index) {
                        return CakeCard(cake: featuredCakes[index])

                            .animate()
                            .fade(duration: 400.ms)
                            .slideY(begin: 0.2);
                      },
                    )

                ),

              ],
            );
          }
        ),
      ),
    );
  }
}

