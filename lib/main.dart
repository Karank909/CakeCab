import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/app_theme.dart';
import 'app/app_routes.dart';
import 'providers/cart_provider.dart';

void main() {
  runApp(const CakeCabApp());
}

class CakeCabApp extends StatelessWidget {
  const CakeCabApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        // Add more providers here later (e.g., FavoritesProvider)
      ],
      child: MaterialApp(
        title: 'CakeCab',
        debugShowCheckedModeBanner: false,
        theme: CakeCabTheme.lightTheme,
        initialRoute: AppRoutes.home,
        routes: appRoutes,
      ),
    );
  }
}
