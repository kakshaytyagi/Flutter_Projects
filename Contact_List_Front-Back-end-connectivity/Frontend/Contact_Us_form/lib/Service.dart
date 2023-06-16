import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Service {
  Future<http.Response> saveUser(String username, String password) async {
    var uri = Uri.parse("http://10.0.2.2:9081/api/register");
    Map<String, String> headers = {"Content-Type": "application/json"};
    Map<String, dynamic> data = {
      'username': username,
      'password': password,
    };
    var body = json.encode(data);
    var response = await http.post(uri, headers: headers, body: body);

    // Print the response body
    print(response.body);

    return response;
  }
}
