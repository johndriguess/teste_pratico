import '../../core/core.dart';
import 'info_page_view_model.dart';

class InfoPageView extends InfoPageViewModel{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Column(
          children: [
            Text('Info Page')
          ]
        )
      ),
    );
  }
}