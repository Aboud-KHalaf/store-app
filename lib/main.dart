import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/firebase_options.dart';
import 'package:store_app/helpers/app_lists_and_maps.dart';
import 'package:store_app/helpers/app_theme.dart';
import 'package:store_app/providers/theme_provider.dart';
import 'package:store_app/root_screen.dart';
import 'package:store_app/screens/main/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppListsAndMaps.providers,
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.themeData(
              isDarkTheme: themeProvider.darkTheme,
              context: context,
            ),
            home: const SplashScreen(),
            routes: AppListsAndMaps.routes,
          );
        },
      ),
    );
  }
}
