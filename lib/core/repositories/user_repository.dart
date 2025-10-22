import '../core.dart';

class UserRepository {
  UserRepository._();
  static final instance = UserRepository._();

  Future<UserModel> fetchRandomUser() async {
    try {
      final request = AppBaseRequest(
        path: AppConstants.instance.randomUserApiRoute,
        requestType: RequestType.get,
      );

      final response = await request.sendRequest(request);

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = json.decode(response.body);

        final List<dynamic> results = body['results'];

        return UserModel.fromJson(results[0]);
      } else {
        throw Exception('Failed to load user');
      }
    } catch (e) {
      rethrow;
    }
  }
}