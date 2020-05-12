import 'package:flutter/material.dart';
import './product_item.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    // Mengambil data product dengan bantuan Provider
    final productData = Provider.of<ProductsProvider>(context);
    final loadedProducts = productData.items;

    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, i) => ProductItem(
        id: loadedProducts[i].id,
        title: loadedProducts[i].title,
        imgUrl: loadedProducts[i].imageUrl,
      ),
    );
  }
}
