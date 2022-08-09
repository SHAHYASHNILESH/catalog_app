import 'package:catalogapp/core/store.dart';
import 'package:catalogapp/models/cart.dart';
import 'package:catalogapp/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  AddToCart({Key? key, required this.catalog}) : super(key: key);
  // const AddToCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.listen(context,to: [AddMutation,RemoveMutation]);

    final CartModel _cart=(VxState.store as MyStore).cart;
    //final CatalogModel _catalog=(VxState.store as MyStore).catalog;
    bool isInCart = _cart.items.contains(catalog) ? true : false;
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            //isInCart = isInCart.toggle();
            //final _catalog = CatalogModel();
            // _cart.catalog = _catalog;
            // _cart.add(catalog);
            AddMutation(catalog);
            //setState(() {});
          }
        },
        style: ButtonStyle(shape: MaterialStateProperty.all(StadiumBorder())),
        child: isInCart ? Icon(Icons.done) :Icon(CupertinoIcons.cart_badge_plus));
  }
}