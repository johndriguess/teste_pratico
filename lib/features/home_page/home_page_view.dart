import '../../core/core.dart';
import 'home_page_view_model.dart';

class HomePageView extends HomePageViewModel{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários (${userList.length})'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.picture.thumbnail),
            ),
            title: Text('${user.name.first} ${user.name.last}'),
            subtitle: Text(user.email),
          );
        },
      ),
    );
  }
}