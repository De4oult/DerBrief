import 'package:der_brief/api/api.dart';
import 'package:der_brief/models/chat_user.dart';
import 'package:der_brief/screens/profile_screen.dart';
import 'package:der_brief/widgets/chat_user_card.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
    const HomeScreen({
        super.key
    });

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    List<ChatUser> list = [];

    @override
    void initState() {
        super.initState();
        API.getSelfInfo();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                // leading: const Icon(CupertinoIcons.home),
                title: const Text('Der Brief'),
                actions: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                    IconButton(
                        onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => ProfileScreen(user: API.me))
                            );
                        },
                        icon: const Icon(Icons.settings)
                    )
                ],
            ),
            floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: FloatingActionButton(
                    onPressed: () {}, 
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: const CircleBorder(),
                    child: const Icon(Icons.add_comment_rounded),
                ),
            ),
            
            body: StreamBuilder(
                stream:  API.getAllUsers(),
                builder: (context, snapshot) {
                    switch(snapshot.connectionState) {
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                            return const Center(
                                child: CircularProgressIndicator()
                            );

                        case ConnectionState.active:
                        case ConnectionState.done:
                            final data = snapshot.data?.docs;

                            list = data?.map((user) => ChatUser.fromJson(user.data())).toList() ?? [];

                            if(list.isEmpty) {
                                return const Center(
                                    child: Text(
                                        'Не соединено', 
                                        style: TextStyle(fontSize: 20)
                                    )
                                );
                            }

                            return ListView.builder(
                                itemCount: list.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                    return ChatUserCard(user: list[index]); //const ChatUserCard();
                                }
                            );
                    }
                }
            )
        );
    }
}