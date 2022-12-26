import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/shop_model.dart';

class CartItemView extends StatelessWidget {
  const CartItemView({super.key, required this.cart});
  final CartItem cart;
  @override
  Widget build(BuildContext context) {
    final item = cart.item;
    final model = Provider.of<ShopModel>(context, listen: false);
    return SizedBox(
        height: 100,
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              item.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
              maxLines: 2,
              item.name,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text("Rs. ${item.price}"),
          trailing: Wrap(
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      model.decreasecartitem(item);
                    },
                    icon: const Icon(
                      CupertinoIcons.minus_square_fill,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      cart.count.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      model.increasecartitem(item);
                    },
                    icon: const Icon(
                      CupertinoIcons.plus_square_fill,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      model.removecartitem(item);
                    },
                    icon: const Icon(
                      CupertinoIcons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
