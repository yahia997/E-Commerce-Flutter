import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/usersDB.dart';
import 'package:project/widgets/purchased.dart';

class shoppingCart extends StatefulWidget {
  const shoppingCart({super.key, required this.data, required this.index});
  final List<Map> data;

  // index of user
  final int index;

  @override
  State<shoppingCart> createState() => _shoppingCartState();
}

class _shoppingCartState extends State<shoppingCart> {
  double totalPrice = 0;
  double totalCount = 0;

  @override
  void initState() {
    // get total price from data
    for (var obj in widget.data) {
      totalPrice += obj['price'] * obj['count'];
      totalCount += obj['count'];
    }

    super.initState();
  }

  // to update total count
  void updateTotal(var change, int count) {
    setState(() {
      // apply new change to price even if it positive or negative
      totalPrice += change;

      // if change is postitive this means that user increased number of total products
      totalCount += count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        foregroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: const Text('Shopping Cart'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  totalCount = 0;
                  totalPrice = 0;

                  // remove data from user object
                  usersDB[widget.index].chart.length = 0;
                });
              },
              icon: const Icon(Icons.delete)),
        ],
      ),
      backgroundColor: white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: widget.data
                  .map((e) => purchased(
                      obj: e, handler: updateTotal, index: widget.index))
                  .toList(),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            left: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // count
                      'Total ${totalCount.toInt()} items',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Text(
                      // total price
                      'USD $totalPrice',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 45,
                ),
                Column(
                  children: [
                    Center(
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              foregroundColor: white,
                              backgroundColor: primary,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 30),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('procced to checkout ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Icon(Icons.arrow_forward_ios_outlined)
                            ],
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
