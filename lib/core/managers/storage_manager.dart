import '../../core/core.dart';

class StorageManager {
  StorageManager._();
  static final instance = StorageManager._();

  final Box<UserModel> _userBox = Hive.box<UserModel>('users');

  Future<void> saveUser(UserModel user) async {
    await _userBox.put(user.login.uuid, user);
  }

  Future<void> deleteUser(String userUuid) async {
    await _userBox.delete(userUuid);
  }

  List<UserModel> getAllUsers() {
    return _userBox.values.toList();
  }

  bool isUserSaved(String userUuid) {
    return _userBox.containsKey(userUuid);
  }

  void listenToUsers(void Function() listener) {
    _userBox.listenable().addListener(listener);
  }
}
