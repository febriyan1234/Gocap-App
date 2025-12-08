import 'package:flutter/material.dart';
import 'package:gocap_app/presentation/home/page/home_menu_page.dart';
import 'package:gocap_app/presentation/home/provider/home_provider.dart';
import 'package:gocap_app/presentation/main/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Tancap ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.white;
            }
            return Colors.grey.shade600;
          }),
          trackColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const Color(0xFF2ECC71);
            }
            return Colors.grey.shade400;
          }),
        ) 
<<<<<<< HEAD
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeProvider()),
        ],
        child: MainPage(),
=======
>>>>>>> 59a59242f6d15088186ad59727a1c3bf3ac535fd
      ),
    );
  }
}