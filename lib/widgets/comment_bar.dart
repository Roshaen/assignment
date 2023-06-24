import 'package:assignment/widgets/dialog_box.dart';
import 'package:flutter/material.dart';

class CommentBar extends StatelessWidget {
  final String imgURL;
  final String comment;
  final IconData? trailingIcon;
  const CommentBar({
    super.key,
    required this.imgURL,
    required this.comment,
    required this.trailingIcon,
  });

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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(imgURL),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(child: Text(comment)),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                child: Icon(trailingIcon),
                onTap: () {
                  dialogBuilder(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
