import 'package:bodytech/screens/home/home_screen.dart';
import 'package:bodytech/screens/list_elements/list_elements.dart';
import 'package:bodytech/screens/login/login_screen.dart';
import 'package:bodytech/screens/register/register_screen.dart';
import 'package:bodytech/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'initialBinding.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: 'login',
      initialBinding: InitialBinding(),
      routes: {
        'home': (_) => HomeScreen(),
        'elements': (_) => ElementsPage(),
        'login': (_) => LoginScreen(),
        'register': (_) => RegisterScreen(),
      },
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[300],
          appBarTheme: const AppBarTheme(elevation: 0, color: Colors.indigo),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.deepPurpleAccent, elevation: 0)),
    );
  }
}
