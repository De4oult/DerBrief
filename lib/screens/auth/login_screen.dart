import 'dart:developer';
import 'dart:io';

import 'package:der_brief/api/api.dart';
import 'package:der_brief/helper/dialogs.dart';
import 'package:der_brief/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

    _handleGoogleButtonClick() {
        Dialogs.showProgressBar(context);

        _signInWithGoogle().then((user) async {
            Navigator.pop(context);

            if(user == null) return;

            if(await API.isUserExist()) {
                Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(builder: (_) => const HomeScreen())
                );
            }
            else {
                await API.createUser().then((value) {
                    Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(builder: (_) => const HomeScreen())
                    );
                });
            }            
        });
    }

    Future<UserCredential?> _signInWithGoogle() async {
        try {
            await InternetAddress.lookup('google.com');

            final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

            final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

            final credential = GoogleAuthProvider.credential(
                accessToken: googleAuth?.accessToken,
                idToken:     googleAuth?.idToken
            );

            return await API.auth.signInWithCredential(credential);
        }
        catch (error) {
            log('\n_signInWithGoogle: $error');

            Dialogs.showSnackbar(context, 'Что-то пошло не так...');

            return null;
        }
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
                        top:      mq.height * .15, 
                        right:    _isAnimate ? mq.width  * .25 : -mq.width * .5, 
                        width:    mq.width  * .5, 
                        duration: const Duration(milliseconds: 500),
                        curve:    Curves.ease,
                        child:    Image.asset('images/icon.png')
                    ),
                    Positioned(
                        bottom: mq.height * .15,
                        left:   mq.width  * .05,
                        width:  mq.width  * .9,
                        height: mq.height * .06,
                        child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: const StadiumBorder(),
                                elevation: 1
                            ),
                            onPressed: () {
                                _handleGoogleButtonClick();
                            },

                            icon: Image.asset(
                                'images/google.png',
                                height: mq.height * .03,
                            ),

                            label: RichText(
                                text: const TextSpan(
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16
                                    ),
                                    children: [
                                        TextSpan(text: 'Login with '),
                                        TextSpan(
                                            text: 'Google',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500
                                            )
                                        )
                                    ]
                                )
                            )
                        )
                    )
                ],
            ),
        );
    }
}