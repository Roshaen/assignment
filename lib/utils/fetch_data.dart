import 'dart:convert';

import 'package:http/http.dart' as http;

class FetchData {
  List commentData = [];
  List finalData = [];
  Future getData() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      if (response.statusCode == 200) {
        commentData = json.decode(response.body).toList();
        for (int i = 0; i < 5; i++) {
          finalData.add(commentData[i]);
        }
        return finalData;
      } else {
        return;
      }
    } catch (_) {
      return;
    }
  }
}
