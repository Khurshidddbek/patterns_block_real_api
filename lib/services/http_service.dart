import 'dart:convert';

import 'package:http/http.dart';
import 'package:patterns_block_real_api/model/contact_model.dart';

class Network {
  static String BASE = '61232709d446280017054a2a.mockapi.io';
  static Map<String,String> headers = {'Content-Type':'application/json'};

  // Http Apis
  static String API_LIST = "/test/contacts";
  static String API_DELETE = "/test/contacts/"; // {id}
  static String API_CREATE = "/test/contacts";
  static String API_UPDATE = '/test/contacts/'; // {id}

  // Http Request
  static Future<String> GET(String api) async {
    var uri = Uri.https(BASE, api);
    var response = await get(uri, headers: headers);
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

  static Future<String> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
}

static Future<String> ADD(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api);
    var response = await post(uri, body: jsonEncode(params), headers: headers);
    if(response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
}

  // Http Params
  static Map<String, String> paramsUpdate(Contact contact) {
    Map<String, String> params = Map();
    params.addAll({
      'id' : contact.id.toString(),
      'username' : contact.username,
      'phone_number' : contact.phoneNumber
    });
    return params;
  }

  static Map<String, String> paramsCreate(Contact contact) {
    Map<String, String> params = Map();
    params.addAll({
    'username' : contact.username,
    'phone_number' : contact.phoneNumber
  });
    return params;
  }

  // Http Parsing
static List<Contact> parseContactList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Contact>.from(json.map((x) => Contact.fromJson(x)));
    return data;
}

static Contact parseContactCreate(String response) {
    dynamic json = jsonDecode(response);
    var data = Contact.fromJson(json);
    return data;
}
}