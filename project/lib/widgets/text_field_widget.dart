// Done by Eng.Abdallah

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';

// ignore: camel_case_types
class text_field_widget extends StatelessWidget {
  const text_field_widget(
  {super.key, 
  required this.controller, 
  required this.prefixicon, 
  this.suffixicon, 
  required this.vistext, 
  this.hint,
  this.hintcolor,
  });

  final TextEditingController controller;
  final Icon prefixicon;
  final IconButton? suffixicon;
  final bool vistext;
  final String? hint;
  final Color? hintcolor;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      obscureText: vistext,
      style: const TextStyle(color: white),
      
      decoration: InputDecoration(
      prefixIcon: prefixicon,
      suffixIcon: suffixicon,
      hintText: hint,
      hintStyle:  TextStyle(color: hintcolor),
      ),

    );
  }
}