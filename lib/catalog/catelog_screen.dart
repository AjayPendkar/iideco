 

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';
import 'cart_screen.dart';

import 'item_model.dart';
import 'package:badges/badges.dart';

class CatalogScreen extends StatefulWidget {
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  List<ItemModel> mentItemslist = [];
  int _counter = 0;

  prepareMenu() {
    mentItemslist.add(ItemModel(
        image: "https://m.media-amazon.com/images/I/51QcJgVLLgS._SL1500_.jpg",
        name: "Eggs",
        price: 36.5));
    mentItemslist.add(ItemModel(
        image:
            "https://5.imimg.com/data5/IQ/NS/MY-11305339/whole-uncooked-raw-chicken-500x500.jpg",
        name: "Chicken",
        price: 200));
    mentItemslist.add(ItemModel(
        image: "https://m.media-amazon.com/images/I/41zUIRvyA0L._SX425_.jpg",
        name: "Mutton",
        price: 850));
    mentItemslist.add(ItemModel(
        image:
            "https://t3.ftcdn.net/jpg/02/91/35/16/360_F_291351618_2ggRlHpK6pSwjUNtgMqhdaYliUYA5Jox.jpg",
        name: "Fish",
        price: 145));
    mentItemslist.add(ItemModel(
        image: "https://m.media-amazon.com/images/I/51Rfg0O0qoL._SL1000_.jpg",
        name: "Soda",
        price: 70));
  }

  CartProvider cartProvider;

  @override
  void initState() {
    prepareMenu();
    cartProvider = Provider.of<CartProvider>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Catalog"),
        actions: [
          Badge(
            badgeContent: Text(_counter.toString()),
            position: BadgePosition.topEnd(top: 0, end: 3),
            child: IconButton(
                icon: Icon(Icons.menu_book_outlined),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                }),
          ),
        ],
      ),
      body: InkWell(
        onTap: () {},
        child: ListView.builder(
            itemCount: mentItemslist.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: (mentItemslist[index].image != null)
                      ? Image.network(
                          mentItemslist[index].image,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          "https://m.media-amazon.com/images/I/51Rfg0O0qoL._SL1000_.jpg",
                          fit: BoxFit.cover,
                        ),
                  title: Text(
                    mentItemslist[index].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    mentItemslist[index].price.toString(),
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      setState(() {
                        _counter++;
                      });
                      cartProvider.addToCart(mentItemslist[index]);
                      print("Aj" + mentItemslist[index].image);
                    },
                  ),
                ),
              );
            }),
      ),
    );
  }
}
