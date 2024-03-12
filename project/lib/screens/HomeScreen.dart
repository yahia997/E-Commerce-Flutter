import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/models/Users.dart';
import 'package:project/widgets/FProducts.dart';
import 'package:project/widgets/Filter.dart';
import 'package:project/widgets/SayHi.dart';
import 'package:project/widgets/StarterProducts.dart';
import 'package:project/screens/myDrawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.user,
  });

  // index of user's object in usersDB
  final Users user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => MyDrawer(user: user)));
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                "assets/images/Avatar.png",
                height: 45,
                width: 45,
              ),
            ),
          ),
        ],
        title: Image.asset("assets/images/Logo.png"),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => MyDrawer(user: user)));
          },
          child: Image.asset("assets/images/menu-variant.png"),
        ),
        backgroundColor: white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: white,
          ),
          child: Column(
            children: [
              SayHi(name: user.name),
              Container(
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                    color: greyLight,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: Column(
                  children: [
                    Filter(user: user),
                    const SizedBox(
                      height: 20,
                    ),
                    StarterProducts(user: user),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Featured Products",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(fontSize: 18, color: greyDark),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FProducts(user: user),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
