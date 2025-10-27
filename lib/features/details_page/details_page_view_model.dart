import '../../core/core.dart';

abstract class DetailsPageViewModel extends State<DetailsPage>{
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String formatGender(String gender) {
    return gender == 'male' ? 'Masculino' : 'Feminino';
  }

  String formatDate(String dateString) {
    final date = DateTime.parse(dateString);
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  
}