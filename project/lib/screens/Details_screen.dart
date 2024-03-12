import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/models/Products.dart';
import 'package:project/models/Users.dart';
import 'package:project/usersDB.dart';
import 'package:project/screens/shoppingCart.dart';

class Details_screen extends StatelessWidget {
  const Details_screen({super.key, required this.user, required this.product});
  final Users user;
  final Products product;

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
          title: const Text(""),
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
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("USD ${product.price}",
                    style: const TextStyle(
                        color: primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                SizedBox(
                  width: 250,
                  child: Text(product.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 28)),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 30
                  ),
                  padding: const EdgeInsets.all(20),
                  width: 285,
                  height: 391,
                  decoration: BoxDecoration(
                    color: grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset("assets/images/${product.img}",
                      fit:BoxFit.contain,),
                ),
                const Text("Description", style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),),
                Text(product.description, style: const TextStyle(
                  fontSize: 16
                ),),
                const SizedBox(height: 30,),
                ElevatedButton(
                    onPressed: () {
                      // add product to cart
                      user.chart.add({
                        "name": product.name,
                        "price": product.price,
                        "count": 1, // default is one
                        "img": product.img
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: white,
                        backgroundColor: primary,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Add To Cart',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
