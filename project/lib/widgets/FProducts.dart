import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/models/Users.dart';
import 'package:project/productsDB.dart';
import 'package:project/screens/Details_screen.dart';

class FProducts extends StatelessWidget {
  const FProducts({super.key, required this.user});
  final Users user;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: ((MediaQuery.of(context).size.width / 2) / 270),
        controller: ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,

        // get only the first 10 products from list
        children: productsDB
            .sublist(0, 10)
            .map((e) => InkWell(
                  onTap: () {
                    // go to this product page
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) =>
                            Details_screen(user: user, product: e)));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/${e.img}",
                          width: 135,
                          height: 125,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.name,
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              "USD ${e.price}",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ))
            .toList());
  }
}
