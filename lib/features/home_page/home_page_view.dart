import '../../core/core.dart';
import 'home_page_view_model.dart';

class HomePageView extends HomePageViewModel{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Text(
          'Screen Width: ${AppConstants.instance.screenWidth}\n'
          'Screen Height: ${AppConstants.instance.screenHeight}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}