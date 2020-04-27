import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Api {
  static final String baseUrl = "https://192.168.0.104:5001/";

  static dynamic get(String url, {bool withToken = false}) async {
    try {
      http.Response response;
      if (withToken) {
        response = await http.get(baseUrl + url, headers: {
          HttpHeaders.authorizationHeader: "Bearer your_api_token_here"
        });
      } else {
        response = await http.get(baseUrl + url);
      }

      return convert.jsonDecode(response.body);
    } catch (e) {
      print(e);
      return e;
    }
  }

  static dynamic post(String url,
      {bool withToken = false, Map<String, dynamic> body}) async {
    try {
      http.Response response = await http.post(
        baseUrl + url,
        headers: {"Content-Type": "application/json"},
        body: convert.jsonEncode(body),
      );

      // if (withToken) {
      //   response.headers.addAll(
      //       {HttpHeaders.authorizationHeader: "Bearer your_api_token_here"});
      // }

      // response.body.
      //     body: convert.jsonEncode(user.toJson()));

      // var jsonResponse = convert.jsonDecode(response.body);

      return convert.jsonDecode(response.body);
    } catch (e) {
      print(e);
      return e;
    }
  }
}
