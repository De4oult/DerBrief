import 'package:der_brief/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';

late Size mq;

void main() {
    WidgetsFlutterBinding.ensureInitialized();
    
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
    ]).then((value) {
        _initializeFirebase();
        runApp(const MyApp());
    });
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
                        color:  Colors.white
                    ),
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 19
                    ),
                    backgroundColor: Colors.blue,
                )
            ),
            home: const SplashScreen(),
        );
    }
}


// ...

_initializeFirebase() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
    );
}