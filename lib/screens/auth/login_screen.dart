import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../main.dart';

class LoginScreen extends StatefulWidget {
    const LoginScreen({
        super.key
    });

    @override
    State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    bool _isAnimate = false;

    @override
    void initState() {
        super.initState();
        Future.delayed(const Duration(milliseconds: 500), () {
            setState(() {
              _isAnimate = true;
            });
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
                    AnimatedPositioned(
                        top:   mq.height * .15, 
                        right: _isAnimate ? mq.width  * .25 : -mq.width * .5, 
                        width: mq.width  * .5, 
                        duration: const Duration(milliseconds: 500),
                        child: Image.asset('images/icon.png')
                    ),
                ],
            ),
        );
    }
}