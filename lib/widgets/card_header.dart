import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(103, 199, 199, 199),
            blurRadius: 8.0, // soften the shadow
            spreadRadius: 3.0,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Add Comment",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Image.asset(
              "assets/images/cards.png",
              width: 130,
              height: 130,
            ),
          ),
        ],
      ),
    );
  }
}
