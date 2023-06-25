import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FetchData {
  List commentData = [];
  List<String> localData = [];
  Future getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      if (response.statusCode == 200) {
        commentData = json.decode(response.body).toList();
        for (int i = 0; i < 3; i++) {
          var a = json.encode(commentData[i]);
          localData.add(a);
        }
        await prefs.setStringList('items', localData);
      } else {
        return;
      }
    } catch (_) {
      return;
    }
  }
}
