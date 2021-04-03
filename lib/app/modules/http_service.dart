import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpService {
  static getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }


  static Future post_service(String email, String password, path) async {
    var url = '192.168.0.103:3000';

    Map data = {'email': email, 'password': password};

    var _body = jsonEncode(data);

    var headers = {"Content-Type": "application/json", 'form-data': _body};

    var response = await http.post(Uri.http(url, path), headers: headers, body: _body);

    return jsonDecode(response.body);
  }

  static Future get_service(String email, String password, path) async {
    var url = '192.168.0.103:3000';

    Map data = {'email': email, 'password': password};

    var _body = jsonEncode(data);

    var headers = {"Content-Type": "application/json", 'form-data': _body};

    var response = await http.get(Uri.http(url, path), headers: headers);

    return jsonDecode(response.body);
  }
}