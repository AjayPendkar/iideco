import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
        ),
        body: Consumer<CartProvider>(
          builder: (context, data, child) {
            return ListView.builder(
                itemCount: data.myCartItemsList.length,
                itemBuilder: (context, index) {
                  return data.myCartItemsList == null ||
                          data.myCartItemsList.length == 0
                      ? Text("No items in the cart")
                      : Card(
                          child: ListTile(
                            leading: (data.myCartItemsList[index].image != null)
                                ? Image.network(
                                    data.myCartItemsList[index].image,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    "https://m.media-amazon.com/images/I/51Rfg0O0qoL._SL1000_.jpg",
                                    fit: BoxFit.cover,
                                  ),
                            title: Text(
                              data.myCartItemsList[index].name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "\$ " +
                                  data.myCartItemsList[index].price.toString(),
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ),
                        );
                });
          },
        ),
        floatingActionButton: Consumer<CartProvider>(
          builder: (_, data, child) {
            return Text("Cart Total \$ ${data.cartvalue}");
          },
        ));
  }
}
