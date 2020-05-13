import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imgUrl;

  // ProductItem({this.id, this.title, this.imgUrl});

  @override
  Widget build(BuildContext context) {
    
    final dataProduct = Provider.of<Product>(context);

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailScreen.routeName,
          arguments: dataProduct.id,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: GridTile(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.grey,
                width: 0.3,
              ),
            ),
            child: Image.network(
              dataProduct.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          header: GridTileBar(
            leading: IconButton(
              icon: Icon(
                dataProduct.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () {
                dataProduct.setFavorite();
              },
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black26,
            title: Text(
              dataProduct.title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
