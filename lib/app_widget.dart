import 'core/core.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Teste Prático',
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF6F7F8),
        primarySwatch: Colors.indigo,
        primaryColor: const Color(0xFF0F2027),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF0F2027),
          secondary: Color(0xFF2C5364),
          surface: Color(0xFFF6F7F8),
          onPrimary: Color(0xFFF6F7F8),
          onSecondary: Color(0xFFF6F7F8),
          onSurface: Color(0xFF1E293B),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          headlineMedium: TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.w700,
            letterSpacing: 0.3,
          ),
          bodyLarge: TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            color: Color(0xFF64748B),
            fontWeight: FontWeight.w500,
          ),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadowColor: const Color(0x0A000000),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0F2027),
            foregroundColor: Color(0xFFF6F7F8),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F2027),
          foregroundColor: Color(0xFFF6F7F8),
          elevation: 0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      builder: (context, widget) {
        final mediaQuery = MediaQuery.of(context);
        final size = mediaQuery.size;

        AppConstants.instance
          ..screenHeight = size.height
          ..screenWidth = size.width;

        return widget ?? Container();
      },
    );
  }
}
