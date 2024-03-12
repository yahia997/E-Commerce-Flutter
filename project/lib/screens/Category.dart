import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/models/Users.dart';
import 'package:project/productsDB.dart';
import 'package:project/screens/Details_screen.dart';
import 'package:project/usersDB.dart';
import 'package:project/screens/shoppingCart.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.category, required this.user});
  final String category;
  final Users user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset("assets/images/chevron-left.png"),
          ),
        ),
        title: Text(category),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => shoppingCart(
                      data: user.chart, index: usersDB.indexOf(user))));
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset("assets/images/shopping-cart.png"),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: productsDB
            .where((element) => element.category == category)
            .map((e) => InkWell(
                  onTap: () {
                    // go to this product page
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) =>
                            Details_screen(user: user, product: e)));
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            width: 100,
                            decoration: BoxDecoration(
                                color: grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(
                              "assets/images/${e.img}",
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.name,
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                    Text(
                                      "USD ${e.price}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                        "assets/images/star-filled.png"),
                                    Text("${e.rating}")
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
