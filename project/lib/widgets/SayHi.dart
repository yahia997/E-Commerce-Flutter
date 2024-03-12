import 'package:flutter/material.dart';

class SayHi extends StatelessWidget {
  const SayHi({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi, $name",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 5,
          ), // will be changed to write user's name dinamically
          const Text(
            "What are you looking for today?",
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
