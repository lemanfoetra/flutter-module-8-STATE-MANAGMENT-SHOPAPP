import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/product.dart';
import '../widgets/product_grid.dart';
import '../providers/product_provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreeen extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {

    var data = Provider.of<ProductsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
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
            onSelected: (FilterOptions filterOptions){
              if(filterOptions == FilterOptions.Favorites){
                data.setIsFavorite(true);
              }else{
                data.setIsFavorite(false);
              }
            },
          )
        ],
      ),
      body: ProductGrid(),
    );
  }
}
