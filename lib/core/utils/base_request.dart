import 'package:http/http.dart' as http;

enum RequestType { get }

class AppBaseRequest {
  final String path;
  final RequestType requestType;
  final Map<String, dynamic> queryParameters;
  final Map<String, String>? headers;
  final dynamic data;

  AppBaseRequest({
    required this.path,
    this.requestType = RequestType.get,
    this.queryParameters = const {},
    this.headers,
    this.data,
  });

  Future<http.Response> sendRequest(AppBaseRequest request) async {
    final uri = Uri.parse(request.path);
    final headers = request.headers ?? {};

    late http.Response response;

    switch (request.requestType) {
      case RequestType.get:
        response = await http.get(uri, headers: headers);
        break;
    }

    return response;
  }
}
