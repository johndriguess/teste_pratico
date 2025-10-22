import '../../core/core.dart';

abstract class HomePageViewModel extends State<HomePage> with SingleTickerProviderStateMixin{
  List<UserModel> userList = [];

  final _userRepository = UserRepository.instance;
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
      if (mounted) {
        setState(() {
          userList.add(user);
          log('User: ${user.name.first}');
        });
      }
    } catch (e, s) {
      log("Erro ao buscar usuário: $e");
      log(s.toString());
    }
  }

}