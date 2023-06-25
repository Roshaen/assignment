import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddData {
  final String comment;
  final Function updateUI;
  final int id;

  AddData(this.comment, this.updateUI, this.id);

  List<String> newComment = [];
  Future addData() async {
    final response = await http.post(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': "1",
        "userId": id.toString(),
        "title": comment,
        "thumbnailUrl":
            "https://www.google.com/s2/favicons?sz=64&domain_url=yahoo.com"
      }),
    );

    if (response.statusCode == 201) {
      var a = json.decode(response.body);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      newComment = prefs.getStringList('items')!;
      newComment.add(json.encode(a));
      await prefs.setStringList('items', newComment);
      updateUI();
    } else {
      return null;
    }
  }
}
