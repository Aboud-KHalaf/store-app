import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/constants/app_theme.dart';
import 'package:store_app/providers/theme_provider.dart';
import 'package:store_app/root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: AppTheme.themeData(
              isDarkTheme: themeProvider.darkTheme, context: context),
          home: const RootScreen(),
          routes: {},
        );
      }),
    );
  }
}
