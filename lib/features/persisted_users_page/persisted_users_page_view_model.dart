import '../../core/core.dart';

abstract class PersistedUsersPageViewModel extends State<PersistedUsersPage> {

  List<UserModel> persistedUsers = [];

  final _navigatorManager = NavigatorManager.instance;
  final _storageManager = StorageManager.instance;

  Listenable? _usersListenable;

  @override
  void initState() {
    super.initState();
    loadPersistedUsers();
    _usersListenable = _storageManager.getUsersListenable();
    _usersListenable?.addListener(_onUsersChanged);
  }

  @override
  void dispose() {
    _usersListenable?.removeListener(_onUsersChanged);
    super.dispose();
  }

  void loadPersistedUsers() {
    if (mounted) {
      setState(() {
        persistedUsers = _storageManager.getAllUsers();
      });
    }
  }

  void _onUsersChanged() {
    loadPersistedUsers();
  }

  Future<void> removeUser(UserModel user) async {
    await _storageManager.deleteUser(user.login.uuid);
    loadPersistedUsers();
  }

  onPersonButtonPressed(UserModel user){
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.setSelectedUser(user);
    _navigatorManager.to(DetailsPage.route);
  }

}