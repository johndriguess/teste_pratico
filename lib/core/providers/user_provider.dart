import '../core.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _selectedUser;
  
  UserModel? get selectedUser => _selectedUser;
  
  void setSelectedUser(UserModel user) {
    _selectedUser = user;
    notifyListeners();
  }
}