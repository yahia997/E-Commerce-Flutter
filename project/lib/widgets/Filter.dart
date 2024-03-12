import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/models/Users.dart';
import 'package:project/screens/Category.dart';

class Filter extends StatelessWidget {
  const Filter({super.key, required this.user});
  final Users user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 35,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => primary)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => Category(category: "Headphone", user: user)));
              },
              child: const Text(
                "Headphone",
                style: TextStyle(color: white),
              )),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => primary)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => Category(category: "Earbuds", user: user)));
              },
              child: const Text(
                "Earbuds",
                style: TextStyle(color: white),
              )),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => primary)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => Category(category: "Earpads", user: user)));
              },
              child: const Text(
                "Earpads",
                style: TextStyle(color: white),
              )),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => primary)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => Category(category: "LabTop", user: user)));
              },
              child: const Text(
                "LabTop",
                style: TextStyle(color: white),
              )),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
