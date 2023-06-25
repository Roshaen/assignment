import 'package:assignment/utils/add_data.dart';
import 'package:flutter/material.dart';

Future<void> dialogBuilder(BuildContext context, Function updateUI) {
  final comment = TextEditingController();
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Type Below'),
        content: SizedBox(
          height: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 199, 199, 199),
                      blurRadius: 8.0, // soften the shadow
                      // spreadRadius: 3.0,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: comment,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 241, 241, 244),
                    hintText: "Comment",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 241, 241, 244),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 241, 241, 244),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  final AddData ad = AddData(comment.text, updateUI);
                  ad.addData();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 94, 65, 240),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Add"),
              )
            ],
          ),
        ),
      );
    },
  );
}
