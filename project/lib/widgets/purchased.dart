import 'package:flutter/material.dart';
import 'package:project/usersDB.dart';

class purchased extends StatefulWidget {
  const purchased(
      {super.key,
      required this.obj,
      required this.handler,
      required this.index});
  final Map obj;
  final dynamic handler;

  // index of user
  final int index;

  @override
  State<purchased> createState() => _purchasedState();
}

class _purchasedState extends State<purchased> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 135,
              height: 125,
              child: Image.asset(
                "assets/images/${widget.obj['img']}", width: 135, height: 125,), // display product image dynamically,
            ),
            
            SizedBox(
              width: 200,
              height: 125,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.obj['name'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16)), // display product name dynamically
                  Text(
                    '${widget.obj['price']} USD', // display product price dynamically
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            // no negative
                            if (widget.obj['count'] > 1) {
                              widget.obj['count']--;
              
                              // update total price (decrease) and count
                              widget.handler(-widget.obj['price'], -1);
                            }
                          });
                        },
                        child: const Icon(Icons.remove_circle_outline_outlined,
                            size: 30),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('${widget.obj['count']}'),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.obj['count']++;
              
                            // update total price (increase) and count
                            widget.handler(widget.obj['price'], 1);
                          });
                        },
                        child: const Icon(Icons.add_circle_outline_outlined,
                            size: 30),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 125,
              alignment: Alignment.bottomRight,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      // to remove current item from shopping cart
                      usersDB[widget.index].chart.remove(widget.obj);

                      // update total price and number of products
                      widget.handler(
                          -(widget.obj['count'] * widget.obj['price']),
                          -widget.obj['count']);
                    });
                  },
                  icon: const Icon(Icons.delete)),
            ),
          ],
        ));
  }
}
