import 'core/core.dart';

class AppModule extends Module {
  
  @override
  void binds(Injector i){
    super.binds(i);
    i
      ..addSingleton<StorageManager>(() => StorageManager.instance)
      ..addSingleton<NavigatorManager>(() => NavigatorManager.instance)
      
      ..addSingleton<UserRepository>(() => UserRepository.instance);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r
      ..child("/", child: (context) => const HomePage());
  }
}