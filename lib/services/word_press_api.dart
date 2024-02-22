import 'dart:convert';

import "package:http/http.dart" as http;

class WordPressApi {
  late String url;

  WordPressApi(this.url);

  Future<dynamic> getData() async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      } else {
        // If the server returns an error response, throw an exception.
        print(response.statusCode);
        return false;
      }
    } catch (e) {
      // Handle network errors here
      print('Error fetching data: $e');
      return false;
    }
  }
}
