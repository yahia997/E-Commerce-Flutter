import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/models/Users.dart';
import 'package:project/productsDB.dart';
import 'package:project/screens/Details_screen.dart';
import 'package:project/usersDB.dart';

class StarterProducts extends StatelessWidget {
  const StarterProducts({super.key, required this.user});
  final Users user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 220,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // first product
          Container(
            margin: const EdgeInsets.only(right: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(15)),
            width: 350,
            height: 220,
            child: Row(
              children: [
                SizedBox(
                  width: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "TMA-2 HD Wireless 1",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            // go to first product in the list
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) =>
                                Details_screen(user: user, product: productsDB[0])));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: white,
                              side: const BorderSide(
                                  strokeAlign: 0, color: white)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Shop now",
                                style: TextStyle(color: primary),
                              ),
                              Image.asset("assets/images/arrow-right.png")
                            ],
                          ))
                    ],
                  ),
                ),
                Center(
                  child: Image.asset(
                    "assets/images/Auto-added frame2.png",
                  ),
                )
              ],
            ),
          ),

          // second product
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(15)),
            width: 350,
            height: 220,
            child: Row(
              children: [
                SizedBox(
                  width: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "TMA-2 Modular Headphone",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                          onPressed: () {

                            // go to second product in the list
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) =>
                                    Details_screen(user: user, product: productsDB[1])));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: white,
                              side: const BorderSide(
                                  strokeAlign: 0, color: white)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Shop now",
                                style: TextStyle(color: primary),
                              ),
                              Image.asset("assets/images/arrow-right.png")
                            ],
                          ))
                    ],
                  ),
                ),
                Center(
                  child: Image.asset(
                    "assets/images/p16.png",
                    width: 135,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
