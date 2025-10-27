import '../../core/core.dart';

abstract class DetailsPageViewModel extends State<DetailsPage>{
  bool isSaved = false;
  
  final _storageManager = StorageManager.instance;

  @override
  void initState() {
    super.initState();
    checkIfUserIsSaved();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void checkIfUserIsSaved() {
    final user = Provider.of<UserProvider>(context, listen: false).selectedUser;
    if (user != null) {
      setState(() {
        isSaved = _storageManager.isUserSaved(user.login.uuid);
      });
    }
  }

  //FIXME: Não sei se faz sentido fazer isso, visto que n o documento ficou ambiguo, mas implementei a funcionalidade de salvar/remover usuário dos salvos na página de detalhes. Na minha análise só vai haver o comportamento de excluir o usuário (Fiz de um jeito para fazer sentido a existência de salvar no fluxo).
  Future<void> toggleSaveUser() async {
    final user = Provider.of<UserProvider>(context, listen: false).selectedUser;
    if (user == null) return;

    if (isSaved) {
      await _storageManager.deleteUser(user.login.uuid);
      setState(() {
        isSaved = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${user.name.first} ${user.name.last} removido dos salvos'),
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      await _storageManager.saveUser(user);
      setState(() {
        isSaved = true;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${user.name.first} ${user.name.last} salvo com sucesso'),
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  String formatGender(String gender) {
    return gender == 'male' ? 'Masculino' : 'Feminino';
  }

  String formatDate(String dateString) {
    final date = DateTime.parse(dateString);
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  
}