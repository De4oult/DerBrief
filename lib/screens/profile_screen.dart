import 'package:cached_network_image/cached_network_image.dart';
import 'package:der_brief/api/api.dart';
import 'package:der_brief/helper/dialogs.dart';
import 'package:der_brief/main.dart';
import 'package:der_brief/models/chat_user.dart';
import 'package:der_brief/screens/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileScreen extends StatefulWidget {
    final ChatUser user;

    const ProfileScreen({ super.key, required this.user });

    @override
    State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Настройки'),
            ),
            floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child:   FloatingActionButton(
                    backgroundColor: Colors.red,
                    shape: const CircleBorder(),
                    child: const Icon(Icons.logout, color: Colors.white),
                    onPressed: () async {
                        Dialogs.showProgressBar(context);
                        await API.auth.signOut().then((value) async {
                            await GoogleSignIn().signOut().then((value) {
                                Navigator.pop(context);
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                            });
                        });
                    }
                )
            ),
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: mq.width * .05),
                child: Column(
                    children: [
                        SizedBox(width: mq.width, height: mq.height * .03),
                        
                        Stack(
                            children: 
                            [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: CachedNetworkImage(
                                        width:    mq.height * .2,
                                        height:   mq.height * .2,
                                        fit:      BoxFit.fill,
                                        imageUrl: widget.user.image,
                                        placeholder: (context, url) => const CircleAvatar(backgroundColor: Colors.blue, child: Icon(CupertinoIcons.person, color: Colors.white)),
                                        errorWidget: (context, url, error) => const CircleAvatar(backgroundColor: Colors.blue, child: Icon(CupertinoIcons.person, color: Colors.white)),
                                    )
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: MaterialButton(
                                        elevation: 1,
                                        color: Colors.white,
                                        shape: const CircleBorder(),
                                        onPressed: () {},
                                        child: const Icon(Icons.edit, color: Colors.blue)
                                    )
                                )
                            ]
                        ),
                        
                        SizedBox(width: mq.width, height: mq.height * .03),
                        
                        Text(
                            widget.user.email, 
                            style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 16
                            )
                        ),
                        
                        SizedBox(width: mq.width, height: mq.height * .03),

                        TextFormField(
                            initialValue: widget.user.username,
                            cursorColor: Colors.blue,
                            decoration:   InputDecoration(
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                prefixIconColor: Colors.blue,
                                hoverColor: Colors.blue,
                                focusColor: Colors.blue,
                                fillColor: Colors.blue,
                                hintText: 'username',
                                label: const Text(
                                    'Имя пользователя',
                                    style: TextStyle(
                                        color: Colors.blue
                                    )
                                )
                            ),
                        ),

                        SizedBox(width: mq.width, height: mq.height * .02),

                        TextFormField(
                            initialValue: widget.user.about,
                            cursorColor: Colors.blue,
                            decoration:   InputDecoration(
                                prefixIcon: const Icon(Icons.info_outline),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                prefixIconColor: Colors.blue,
                                hoverColor: Colors.blue,
                                focusColor: Colors.blue,
                                fillColor: Colors.blue,
                                hintText: '',
                                label: const Text(
                                    'О себе',
                                    style: TextStyle(
                                        color: Colors.blue
                                    )
                                )
                            ),
                        ),

                        SizedBox(width: mq.width, height: mq.height * .05),

                        ElevatedButton.icon(
                            icon:  const Icon(Icons.edit, color: Colors.white),
                            label: const Text('Сохранить', style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                elevation: 1
                            ),
                            onPressed: () {}
                        )
                    ],
                )
            )
        );
    }
}