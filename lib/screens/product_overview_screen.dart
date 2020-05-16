import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';

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

  void setOnlyFavorite(bool status){
    setState(() {
      onlyFavorite = status;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            onSelected: (FilterOptions filterOption){
              if(filterOption == FilterOptions.Favorites){
                setOnlyFavorite(true);
              }else{
                setOnlyFavorite(false);
              }
            },
          )
        ],
      ),
      body: ProductGrid(isOnlyFavorite: onlyFavorite,),
    );
  }
}
