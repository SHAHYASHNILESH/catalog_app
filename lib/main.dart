import 'package:catalogapp/core/store.dart';
import 'package:catalogapp/pages/home_page.dart';
import 'package:catalogapp/pages/login_page.dart';
import 'package:catalogapp/pages/cart_page.dart';
import 'package:catalogapp/utils/routes.dart';
import 'package:catalogapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';
//import 'package:google_fonts/google_fonts.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store:MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Understanding data types in dart

    // bool isMale=true;
    // num temp=30.5;
    // double pi=3.14;
    // const PI=3.14;
    // var day="Saturday";

    return MaterialApp(
      // home:HomePage(),
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),
      debugShowCheckedModeBanner: false,

      initialRoute: '/login',
      routes: {
        '/': (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
