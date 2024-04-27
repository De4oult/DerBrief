import 'package:der_brief/screens/auth/login_screen.dart';
import 'package:der_brief/api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
    const SplashScreen({
        super.key
    });

    @override
    State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
    void initState() {
        super.initState();
        Future.delayed(const Duration(seconds: 2), () {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
            SystemChrome.setSystemUIOverlayStyle(
                const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent
                )
            );
            
            if(API.auth.currentUser != null) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
            else                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen())
            );
        });
    }

    @override
    Widget build(BuildContext context) {
        mq = MediaQuery.of(context).size;

        return Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: const Text('Der Brief')
            ),
            body: Stack(
                children: [
                    Positioned(
                        top:   mq.height * .15, 
                        right: mq.width  * .25, 
                        width: mq.width  * .5, 
                        child: Image.asset('images/icon.png')
                    ),
                    Positioned(
                        bottom: mq.height * .15,
                        width:  mq.width,
                        child:  const Text(
                            'Made with love 💕',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                letterSpacing: .5
                            )
                        )
                    )
                ],
            ),
        );
    }
}