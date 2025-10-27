import '../../core/core.dart';

abstract class HomePageViewModel extends State<HomePage> with SingleTickerProviderStateMixin{
  List<UserModel> userList = [];

  final _userRepository = UserRepository.instance;
  final _storageManager = StorageManager.instance;
  final _navigatorManager = NavigatorManager.instance;
  late final AnimationController _tickerController;

  @override
  void initState() {
    super.initState();

    _tickerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _tickerController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _fetchAndAddUser();
        _tickerController.forward(from: 0); 
      }
    });

    _tickerController.forward();
    _fetchAndAddUser();
  }

  @override
  void dispose() {
    _tickerController.dispose();
    super.dispose();
  }

  Future<void> _fetchAndAddUser() async {
    try {
      final user = await _userRepository.fetchRandomUser();
      
      await _storageManager.saveUser(user);

      if (mounted) {
        setState(() {
          userList.add(user);
          //log para debug
          //log('User: ${user.name.first}');
        });
      }
    } catch (e, s) {
      log("Erro: $e");
      log(s.toString());
    }
  }


  onPersonButtonPressed(UserModel user){
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.setSelectedUser(user);
    _navigatorManager.to(DetailsPage.route);
  }

  onDatabaseButtonPressed(){
    
    _navigatorManager.to(PersistedUsersPage.route);
  }



}