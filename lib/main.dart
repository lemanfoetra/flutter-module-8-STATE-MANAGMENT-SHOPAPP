import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/product_detail_screen.dart';
import './screens/product_overview_screen.dart';
import './providers/product_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx)=> ProductsProvider(),
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          fontFamily: 'Lato',
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => ProductOverviewScreeen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
        onUnknownRoute: (setting) {
          return MaterialPageRoute(
            builder: (ctx) => ProductOverviewScreeen(),
          );
        },
      ),
    );
  }
}
