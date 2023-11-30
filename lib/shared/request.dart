import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<http.Response> requestLocal(String route, String method,
    {bool isToken = true, dynamic body}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  String baseUrl = dotenv.dotenv.get('localhost:3333');

  http.Response response;
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': isToken ? 'Bearer $token' : '',
  };

  switch (method) {
    case 'GET':
      response = await http.get(Uri.parse('$baseUrl$route'), headers: headers);
      break;
    case 'POST':
      print("hahahahah");
      response = await http.post(Uri.parse('$baseUrl$route'),
          headers: headers, body: body);
      break;
    case 'PUT':
      response = await http.put(Uri.parse('$baseUrl$route'),
          headers: headers, body: body);
      break;
    case 'DELETE':
      response =
          await http.delete(Uri.parse('$baseUrl$route'), headers: headers);
      break;
    default:
      throw Exception('Invalid HTTP method');
  }

  return response;
}
