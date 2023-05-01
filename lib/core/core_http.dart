import 'package:http/http.dart' as http;

Future<http.Response> getHttp({required String url}) {
  return http.get(
    Uri.parse(url),
  );
}

Future<http.Response> postOrderHttp(String url,
    {required Map<String, String> headers, required String body}) {
  return http.post(
    Uri.parse(url),
    headers: headers,
    body: body,
  );
}
