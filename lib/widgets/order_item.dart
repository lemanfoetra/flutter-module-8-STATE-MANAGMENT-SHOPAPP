import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/orders_provider.dart' as oiProvider;

class OrderItem extends StatelessWidget {
  final oiProvider.OrderItem order;

  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text("\$ ${order.amount} "),
            subtitle: Text(
              DateFormat('mm-dd-YYYY hh:ii').format(order.time).toString(),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
