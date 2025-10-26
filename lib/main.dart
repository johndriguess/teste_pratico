import 'core/core.dart';
import 'app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storageManager = StorageManager.instance;
  await storageManager.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: ModularApp(
        module: AppModule(), 
        child: const AppWidget()
      ),
    ),
  );
}