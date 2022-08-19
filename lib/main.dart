import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'catalog/cart_provider.dart';
import 'catalog/catelog_screen.dart';


void main() {
  // this is for timerprovider
  
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CartProvider()),

  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CatalogScreen(),
    );
  }
}
