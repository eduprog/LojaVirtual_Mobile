import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:lojavirtual_mobile/services/storage.service.dart';
import 'package:lojavirtual_mobile/services/utils/user.authenticated.model.dart';

class Api {
  static final String baseUrl = "https://192.168.0.104:5001/";

  static Future<String> getTokenJwt() async {
    StorageService storage = StorageService();

    var data = await storage.readAuthUser();
    var auth = UserAuthenticated.fromJson(convert.jsonDecode(data));
    return auth.accessToken;
  }

  static dynamic get(String url, {bool withToken = false}) async {
    try {
      http.Response response;
      if (withToken == true) {
        String token = await getTokenJwt();
        response = await http.get(
          baseUrl + url,
          headers: {
            "Content-Type": "application/json",
            HttpHeaders.authorizationHeader: "Bearer $token"
          },
        );
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
      http.Response response;

      if (withToken == true) {
        String token = await getTokenJwt();
        response = await http.post(
          baseUrl + url,
          headers: {
            "Content-Type": "application/json",
            HttpHeaders.authorizationHeader: "Bearer $token"
          },
          body: convert.jsonEncode(body),
        );
      } else {
        response = await http.post(
          baseUrl + url,
          headers: {"Content-Type": "application/json"},
          body: convert.jsonEncode(body),
        );
      }
      return convert.jsonDecode(response.body);
    } catch (e) {
      print(e);
      return e;
    }
  }

  static dynamic put(String url,
      {bool withToken = false, Map<String, dynamic> body}) async {
    try {
      http.Response response;

      if (withToken == true) {
        String token = await getTokenJwt();
        response = await http.put(
          baseUrl + url,
          headers: {
            "Content-Type": "application/json",
            HttpHeaders.authorizationHeader: "Bearer $token"
          },
          body: body == null ? null : convert.jsonEncode(body),
        );
      } else {
        response = await http.put(
          baseUrl + url,
          headers: {"Content-Type": "application/json"},
          body: body == null ? null : convert.jsonEncode(body),
        );
      }
      return convert.jsonDecode(response.body);
    } catch (e) {
      print(e);
      return e;
    }
  }

  static dynamic delete(String url, {bool withToken = false}) async {
    try {
      http.Response response;
      if (withToken == true) {
        String token = await getTokenJwt();
        response = await http.delete(
          baseUrl + url,
          headers: {
            "Content-Type": "application/json",
            HttpHeaders.authorizationHeader: "Bearer $token"
          },
        );
      } else {
        response = await http.delete(baseUrl + url);
      }

      return convert.jsonDecode(response.body);
    } catch (e) {
      print(e);
      return e;
    }
  }
}
