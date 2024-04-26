import 'package:der_brief/screens/auth/login_screen.dart';
import 'package:der_brief/screens/home_screen.dart';
import 'package:flutter/material.dart';

late Size mq;

void main() {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title : 'Der Brief',
            theme : ThemeData(
                appBarTheme: const AppBarTheme(
                    elevation: 1,
                    iconTheme: IconThemeData(
                        color:  Colors.black
                    ),
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 19
                    ),
                    backgroundColor: Colors.white,
                )
            ),
            home: const LoginScreen(),
        );
    }
}