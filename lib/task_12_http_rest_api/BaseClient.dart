import 'package:http/http.dart' as http;
const String BaseURL = "http://631c37911b470e0e12fcdd0b.mockapi.io/api";

class BaseClient {
  var client = http.Client();
  Future<dynamic> get(String api) async {
    var url = Uri.parse(BaseURL + api);
    var response = await client.get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
  }

  Future<dynamic> post(String api) async {}

  Future<dynamic> put(String api) async {}

  Future<dynamic> delete(String api) async {}

}
