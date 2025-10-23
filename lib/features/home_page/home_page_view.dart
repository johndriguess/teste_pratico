import '../../core/core.dart';
import 'home_page_view_model.dart';

class HomePageView extends HomePageViewModel{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Usuários (${userList.length})'),
        ),
        body: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            final user = userList[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.instance.screenHeight * 0.02),
              child: PersonCard(
                name: '${user.name.first} ${user.name.last}', 
                email: user.email, 
                pictureThumbnail: user.picture.thumbnail, 
                onTap: () {
                  
                }
              ),
            );
          },
        ),
      ),
    );
  }
}