import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/shop_model.dart';
import 'package:shopping_app/Screen/home.dart';
import 'package:shopping_app/Screen/splash.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ShopModel(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      initialRoute: "/splash",
      theme: ThemeData(
        textTheme: GoogleFonts.outfitTextTheme(),
      ),
      routes: {
        "/splash": (context) => const Splash(),
      },
      home: const Home(),
    ),
  ));
}
