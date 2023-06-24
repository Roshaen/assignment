import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class CommentBar extends StatelessWidget {
  const CommentBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 241, 241, 244),
          border: Border.all(color: Colors.black26),
          borderRadius: const BorderRadius.all(Radius.circular(18)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage:
                  NetworkImage("https://via.placeholder.com/150/92c952"),
            ),
            Text("This is the first"),
            Icon(FluentIcons.add_24_filled)
          ],
        ),
      ),
    );
  }
}
