import 'core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storageManager = StorageManager.instance;
  await storageManager.init();

  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    AppConstants.instance.init(context);
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF6F7F8)
      ),
    );
  }
}