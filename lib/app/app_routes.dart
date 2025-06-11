import 'package:flutter/material.dart';
import '../views/home/home_page.dart';
import '../views/cart/cart_page.dart';
import '../views/checkout/checkout_page.dart';
import '../views/profile/profile_page.dart';
import '../views/favorites/favorites_page.dart';
import '../views/order_success/order_success_page.dart';
import '../views/my_orders/my_order_page.dart';


class AppRoutes {
  static const String home = '/';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String profile = '/profile';
  static const String orders = '/orders';
  static const String favorites = '/favorites';
  static const String success = '/order-success';
}

final Map<String, WidgetBuilder> appRoutes = {
  AppRoutes.home: (context) => const HomePage(),
  AppRoutes.cart: (context) => const CartPage(),
  AppRoutes.checkout: (context) => const CheckoutPage(),
  AppRoutes.profile: (context) => const ProfilePage(allCakes: [],),
  AppRoutes.favorites: (context) => const FavoritesPage(allCakes: [],),
  AppRoutes.orders: (context) => const MyOrdersPage(),
  AppRoutes.success: (context) => const OrderSuccessPage(),
};
