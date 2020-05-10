import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;

  ProductItem({this.id, this.title, this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('print product');
      },
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 0.3,
            ),
          ),
          child: Image.network(
            imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        header: GridTileBar(
          leading: IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              print('icon favorite');
            },
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black26,
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
