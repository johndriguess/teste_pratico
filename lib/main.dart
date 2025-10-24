import 'core/core.dart';
import 'app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storageManager = StorageManager.instance;
  await storageManager.init();

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}