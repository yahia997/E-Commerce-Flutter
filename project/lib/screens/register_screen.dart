// Done by Eng.Abdallah

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/models/Users.dart';
import 'package:project/screens/login_screen.dart';
import 'package:project/usersDB.dart';
import 'package:project/widgets/text_field_widget.dart';

// ignore: camel_case_types
class register_screen extends StatefulWidget {
  const register_screen({super.key});

  @override
  State<register_screen> createState() => _register_screenState();
}

class _register_screenState extends State<register_screen> {
  bool vistext1 = true;
  bool vistext2 = true;
  bool showerror = false;
  var emailcontroller = TextEditingController();
  var passcontroller1 = TextEditingController();
  var passcontroller2 = TextEditingController();

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
                child: Column(children: [
                  const Text(
                    'Audio',
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 60),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'it’s modular and designed to last ',
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
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
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: text_field_widget(
                      controller: passcontroller1,
                      prefixicon: const Icon(
                        Icons.key,
                        color: white,
                      ),
                      vistext: vistext1,
                      hint: 'password',
                      hintcolor: white,
                      suffixicon: IconButton(
                          onPressed: () {
                            setState(() {
                              vistext1 = !vistext1;
                            });
                          },
                          icon: vistext1
                              ? const Icon(
                                  Icons.visibility,
                                  color: white,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: white,
                                )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: text_field_widget(
                      controller: passcontroller2,
                      prefixicon: const Icon(
                        Icons.key,
                        color: white,
                      ),
                      vistext: vistext2,
                      hint: 'confirm password',
                      hintcolor: white,
                      suffixicon: IconButton(
                          onPressed: () {
                            setState(() {
                              vistext2 = !vistext2;
                            });
                          },
                          icon: vistext2
                              ? const Icon(
                                  Icons.visibility,
                                  color: white,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: white,
                                )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (passcontroller1.text == passcontroller2.text) {
                          
                          // add this user to usersDB
                          Users newUser = Users(
                              name: emailcontroller.text,
                              email: emailcontroller.text,
                              password: passcontroller1.text,
                              chart: []);
                          usersDB.add(newUser);

                          // navigate to login screen to login
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const login_screen()));
                        } else {
                          setState(() {
                            showerror = true;
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
                              horizontal: 134, vertical: 12)),
                      child: const Text(
                        'Register',
                        style: TextStyle(color: white, fontSize: 20),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    const SizedBox(
                      width: 75,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          shape: BoxShape.rectangle,
                          color: white,
                        ),
                        child: const Image(
                          image: AssetImage('assets/images/apple.png'),
                          height: 47,
                          width: 47,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          shape: BoxShape.rectangle,
                          color: white,
                        ),
                        child: const Image(
                          image: AssetImage('assets/images/facebook.png'),
                          height: 47,
                          width: 47,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          shape: BoxShape.rectangle,
                          color: white,
                        ),
                        child: const Image(
                          image: AssetImage('assets/images/google.png'),
                          height: 47,
                          width: 47,
                        ),
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        width: 60,
                      ),
                      const Text(
                        'If you have an account',
                        style: TextStyle(color: white, fontSize: 17),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => const login_screen()));
                          },
                          child: const Text(
                            ' Sign In here',
                            style: TextStyle(fontSize: 17, color: primary),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  showerror
                      ? const Text(
                          'confirm password again',
                          style: TextStyle(color: white, fontSize: 17),
                        )
                      : const Text(''),
                ]),
              ),
            )));
  }
}
