import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ShopModel extends ChangeNotifier {
  final List<Item> _products = [];
  final Map<String, Item> _favourites = {};

  UnmodifiableListView<Item> get products => UnmodifiableListView(_products);
  UnmodifiableMapView<String, Item> get favourites =>
      UnmodifiableMapView(_favourites);

  void fetchProducts() async {
    try {
      final res = await http.get(
        Uri.parse("https://shopping-api.deta.dev/products/all"),
      );

      final Map<String, dynamic> body = convert.jsonDecode(res.body);
      final data = body["data"] as List<dynamic>;
      _products.clear();
      for (var product in data) {
        _products.add(Item(
          product["product_id"],
          product["name"],
          product["price"],
          product["image"],
        ));
      }
      notifyListeners();
    } catch (err) {
      log(err.toString());
    }
  }

  ShopModel() {
    fetchProducts();
  }

  void toggleFavourites(Item item) {
    if (_favourites.containsKey(item.id)) {
      _favourites.removeWhere((key, _) => key == item.id);
    } else {
      _favourites[item.id] = item;
    }
    notifyListeners();
  }
}

@immutable
class Item {
  final String id;
  final String name;
  final double price;
  final String imageUrl;

  const Item(this.id, this.name, this.price, this.imageUrl);
}
