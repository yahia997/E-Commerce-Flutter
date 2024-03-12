// Done by Eng.Abdallah

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/screens/HomeScreen.dart';
import 'package:project/usersDB.dart';
import 'package:project/widgets/text_field_widget.dart';
import 'package:project/screens/register_screen.dart';
import 'package:project/models/Users.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});
  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  bool vistext = true;
  bool showerror = false;
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/cover.png'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                const Text(
                  'Audio',
                  style: TextStyle(
                      color: white, fontWeight: FontWeight.bold, fontSize: 60),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'it’s modular and designed to last ',
                  style: TextStyle(
                      color: white, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: text_field_widget(
                    controller: emailcontroller,
                    prefixicon: const Icon(
                      Icons.person,
                      color: white,
                    ),
                    vistext: false,
                    hint: 'email',
                    hintcolor: white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: text_field_widget(
                      controller: passcontroller,
                      prefixicon: const Icon(
                        Icons.key,
                        color: white,
                      ),
                      vistext: vistext,
                      hint: 'password',
                      hintcolor: white,
                      suffixicon: IconButton(
                          onPressed: () {
                            setState(() {
                              vistext = !vistext;
                            });
                          },
                          icon: vistext
                              ? const Icon(
                                  Icons.visibility,
                                  color: white,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: white,
                                ))),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'forgot password',
                  style: TextStyle(color: white, fontSize: 15),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      // check if user in usersDB (regestered)
                      List<Users> filtered = usersDB
                          .where((element) =>
                              element.email == emailcontroller.text &&
                              element.password == passcontroller.text)
                          .toList();

                      // if list is not empty (user regestered)
                      if(filtered.isNotEmpty) {

                        // go to home page
                        Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (ctx)=> HomeScreen(user: filtered[0])));

                      }else {
                        // show error
                        setState(() {
                         showerror=true;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                        backgroundColor: primary,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 140, vertical: 12)),
                    child: const Text(
                      'sign in',
                      style: TextStyle(color: white, fontSize: 20),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 60,
                    ),
                    const Text(
                      'Didn’t have any account?',
                      style: TextStyle(color: white, fontSize: 17),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const register_screen()));
                        },
                        child: const Text(
                          'Register here',
                          style: TextStyle(fontSize: 17, color: primary),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (showerror)
                  const Text(
                    'Wrong email or password',
                    style: TextStyle(color: white),
                  )
                else
                  const Text('')
              ],
            )))));
  }
}
