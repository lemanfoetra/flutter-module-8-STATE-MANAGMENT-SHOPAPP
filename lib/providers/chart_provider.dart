import 'package:flutter/foundation.dart';

class ChartItem {
  final String id;
  final String title;
  final double quantity;
  final double price;

  ChartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class ChartProvider with ChangeNotifier {
  Map<String, ChartItem> _items;

  Map<String, ChartItem> get items {
    return {..._items};
  }

  void addChart(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingData) => ChartItem(
              id: existingData.id,
              price: existingData.price,
              title: existingData.title,
              quantity: existingData.quantity + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => ChartItem(
              id: DateTime.now().toString(),
              price: price,
              title: title,
              quantity: 1));
    }
  }
}
