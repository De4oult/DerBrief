import 'package:cached_network_image/cached_network_image.dart';
import 'package:der_brief/main.dart';
import 'package:der_brief/models/chat_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatUserCard extends StatefulWidget {
    final ChatUser user;

    const ChatUserCard({ 
        super.key,
        required this.user
    });

    @override
    State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
    @override
    Widget build(BuildContext context) {
        return Card(
            margin: const EdgeInsets.symmetric(horizontal: 0),
            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 0,
            child: InkWell(
                child: ListTile(
                    leading: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.07), 
                                    spreadRadius: 1, 
                                    blurRadius: 3,
                                    offset: const Offset(0, 1)
                                ),
                            ],
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                                width:    mq.height * .055,
                                height:   mq.height * .055,
                                imageUrl: widget.user.image,
                                placeholder: (context, url) => const CircleAvatar(backgroundColor: Colors.blue, child: Icon(CupertinoIcons.person, color: Colors.white)),
                                errorWidget: (context, url, error) => const CircleAvatar(backgroundColor: Colors.blue, child: Icon(CupertinoIcons.person, color: Colors.white)),
                            )
                        ),
                    ),
                    title:   Text(widget.user.username),
                    subtitle: Text(
                        widget.user.about,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.black54
                        )
                    ),
                    trailing: Container(
                        width:  8,
                        height: 8,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)
                        ),
                    ),
                    // Text(
                    //     '12:00',
                    //     style: TextStyle(
                    //         color: Colors.black54
                    //     )
                    // ),
                    tileColor: Colors.white,
                ),
                onTap: () {}
            )
        );
    }
}