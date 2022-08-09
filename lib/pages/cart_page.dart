import 'package:catalogapp/core/store.dart';
import 'package:catalogapp/models/cart.dart';
import 'package:catalogapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyThemes.cardColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: "Cart".text.black.make(),
        ),
        body: Column(
          children: [CartList().p32().expand(), Divider(), CartTotal()],
        ));
  }
}

class CartTotal extends StatelessWidget {
  // final _cart = CartModel();
  final CartModel _cart = (VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (context, _) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(Colors.deepOrange)
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying Not Supported yet...".text.make()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: "Buy".text.white.make())
              .w32(context)
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    VxState.listen(context, to: [RemoveMutation]);
    return _cart.items.isEmpty
        ? "Nothing to show in cart".text.xl4.white.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  tileColor: Colors.white,
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                      //color: Colors.white,
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        RemoveMutation(_cart.items[index]);
                        // _cart.remove(_cart.items[index]);
                        //setState(() {
                      }),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
