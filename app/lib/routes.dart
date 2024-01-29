import 'package:app/common/bottom_bar.dart';
import 'package:app/pages/pages.dart';
import 'package:flutter/material.dart';
import './pages/home/category_deal_screen.dart';
import './models/models.dart';

Route<dynamic> genrateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AuthPage.routeName:
      return MaterialPageRoute(builder: (_) => const AuthPage());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(builder: (_) => const BottomBar());

    case CategoryDealsScreen.routeName:
      var category = settings.arguments as String;
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => CategoryDealsScreen(
          category: category,
        ),
      );
    case SearchScreen.routeName:
      var searchQuery = settings.arguments as String;
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    case ProductDetailScreen.routeName:
      var product = settings.arguments as Product;
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => ProductDetailScreen(
          product: product,
        ),
      );
    case AddressScreen.routeName:
      var totalAmount = settings.arguments as String;
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => AddressScreen(
          totalAmount: totalAmount,
        ),
      );
    case OrderDetailScreen.routeName:
      var order = settings.arguments as Order;
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Text("No Routes !!!!"),
              ));
  }
}
