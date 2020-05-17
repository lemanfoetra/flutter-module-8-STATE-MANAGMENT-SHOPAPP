import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/widgets/badge.dart';
import '../widgets/product_grid.dart';
import '../providers/chart_provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreeen extends StatefulWidget {
  @override
  _ProductOverviewScreeenState createState() => _ProductOverviewScreeenState();
}

class _ProductOverviewScreeenState extends State<ProductOverviewScreeen> {
  bool onlyFavorite = false;

  void setOnlyFavorite(bool status) {
    setState(() {
      onlyFavorite = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    final chart = Provider.of<ChartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          Consumer<ChartProvider>(
            builder: (ctx, _, ch) => Badge(
              child: IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {},
              ),
              value: chart.totalChart.toString(),
            ),
          ),
          PopupMenuButton(
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Tampilkan Favorit'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Semua'),
                value: FilterOptions.All,
              )
            ],
            onSelected: (FilterOptions filterOption) {
              if (filterOption == FilterOptions.Favorites) {
                setOnlyFavorite(true);
              } else {
                setOnlyFavorite(false);
              }
            },
          )
        ],
      ),
      body: ProductGrid(
        isOnlyFavorite: onlyFavorite,
      ),
    );
  }
}
