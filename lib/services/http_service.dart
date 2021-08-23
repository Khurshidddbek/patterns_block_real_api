import 'dart:convert';

import 'package:http/http.dart';
import 'package:patterns_block_real_api/model/contact_model.dart';

class Network {
  static String BASE = '61232709d446280017054a2a.mockapi.io';

  // Http Apis
  static String API_LIST = "/test/contacts";
  static String API_DELETE = "/test/contacts/"; // {id}

  // Http Request
  static Future<String> GET(String api) async {
    var uri = Uri.https(BASE, api);
    var response = await get(uri);
    if(response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String> DEL(String api) async {
    var uri = Uri.https(BASE, api);
    var response = await delete(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  // Http Parsing
static List<Contact> parseContactList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Contact>.from(json.map((x) => Contact.fromJson(x)));
    return data;
}
}