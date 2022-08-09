import 'package:catalogapp/widgets/add_to_cart.dart';
import 'package:catalogapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalogapp/models/catalog.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        //foregroundColor: Colors.white,
      ),
      backgroundColor: MyThemes.darkCreamColor,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,

        children: [
          "\$${catalog.price}".text.bold.xl4.red500.make(),
            AddToCart(catalog: catalog).wh(120, 50),
        ],
      ).p8(),
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.image)).p8()
                  .h32(context),
              Container(
                  //color: Colors.red,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(MyThemes.darkBluishColor)
                          .bold
                          .white.make(),
                      catalog.desc.text.xl
                          .textStyle(context.captionStyle)
                          .white.make(),
                      10.heightBox,
                      "Dolor sea takimata ipsum sea eirmod aliquyam est. Eos ipsum voluptua eirmod elitr, no dolor dolor amet eirmod dolor labore dolores magna. Amet vero vero vero kasd, dolore sea sed sit invidunt nonumy est sit clita. Diam aliquyam amet tempor diam no aliquyam invidunt. Elitr lorem eirmod dolore clita. Rebum."
                          .text.white
                          .textStyle(context.captionStyle)
                          .white
                          .make()
                          .p16()
                    ],
                  ).py64()),
            ],
          ),
        ),
      ),
    );
  }
}
