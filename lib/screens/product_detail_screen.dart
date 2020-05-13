import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class ProductDetailScreen extends StatelessWidget {

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {

    var productId = ModalRoute.of(context).settings.arguments as String;
    final dataProduct = Provider.of<ProductsProvider>(context).findById(productId);
    Provider<String>(create: (ctx)=> 'Hi all',);

    return Scaffold(
      appBar: AppBar( 
        title: Text(dataProduct.title),
      ),
    ); 
  }
}