// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/shop_model.dart';
import 'package:shopping_app/components/cart_item.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ShopModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "Cart",
            style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Total Amount: Rs. ${model.cartTotal}",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 104, 99, 99),
            ),
          ),
        ),
        Expanded(
          child: Consumer<ShopModel>(
            builder: (context, shop, child) {
              final cartlist = shop.cart.values.toList();
              return ListView.builder(
                itemCount: cartlist.length,
                itemBuilder: (context, index) {
                  return CartItemView(
                    cart: cartlist[index],
                  );
                },
              );
            },
          ),
        ),
      ]),
    );
  }
}
