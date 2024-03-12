// Done by Eng.Yassmin

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/models/Users.dart';
import 'package:project/screens/HomeScreen.dart';
import 'package:project/screens/login_screen.dart';
import 'package:project/usersDB.dart';
import 'package:project/screens/shoppingCart.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key, required this.user}) : super(key: key);
  final Users user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPictureSize: const Size.square(75),
              currentAccountPicture: const SizedBox(
                height: 200,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Avatar.png'),
                  backgroundColor: Colors.grey,
                ),
              ),
              decoration: const BoxDecoration(color: primary),
              accountName: Text(
                user.name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(user.email)),
          ListTile(
            title: const Text('HomeScreen'),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeScreen(user: user)),
              );
            },
          ),
          ListTile(
            title: const Text('MyProduct'),
            leading: const Icon((Icons.add_shopping_cart)),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => shoppingCart(data: user.chart, index: usersDB.indexOf(user))));
            },
          ),
          ListTile(
            title: const Text('about'),
            leading: const Icon(Icons.help_center),
            onTap: () {},
          ),
          ListTile(
            title: const Text('LogOut'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const login_screen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
