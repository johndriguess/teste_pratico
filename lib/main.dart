import 'core/core.dart';
import 'app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(NameModelAdapter());
  Hive.registerAdapter(LocationModelAdapter());
  Hive.registerAdapter(StreetModelAdapter());
  Hive.registerAdapter(CoordinatesModelAdapter());
  Hive.registerAdapter(TimezoneModelAdapter());
  Hive.registerAdapter(DobModelAdapter());
  Hive.registerAdapter(LoginModelAdapter());
  Hive.registerAdapter(IdModelAdapter());
  Hive.registerAdapter(PictureModelAdapter());
  Hive.registerAdapter(RegisteredModelAdapter());
  
  await Hive.openBox<UserModel>('users');

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