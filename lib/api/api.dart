import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:der_brief/models/chat_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class API {
    static FirebaseAuth auth = FirebaseAuth.instance;
    
    static FirebaseFirestore firestore = FirebaseFirestore.instance;

    static late ChatUser me;

    static get user => auth.currentUser!;

    static Future<bool> isUserExist() async {
        return (
            await firestore
                .collection('users')
                .doc(user.uid)
                .get()
        ).exists;
    }

    static Future<void> createUser() async {
        final time = DateTime.now().microsecondsSinceEpoch.toString();

        final chatUser = ChatUser(
            id:         user.uid, 
            username:   user.displayName.toString(),
            email:      user.email.toString(), 
            about:      '', 
            image:      user.photoURL.toString(), 
            createdAt:  time, 
            isOnline:   false, 
            lastActive: time, 
            pushToken: ''
        );

        return await firestore
            .collection('users')
            .doc(user.uid)
            .set(chatUser.toJson());
    }

    static Future<void> getSelfInfo() async {
        await firestore
            .collection('users')
            .doc(user.uid)
            .get()
            .then((user) async {
                if(user.exists) {
                    me = ChatUser.fromJson(user.data()!);
                } else {
                    await createUser().then((value) => getSelfInfo());
                }
            });
    }

    static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers() => firestore.collection('users').where('id', isNotEqualTo: user.uid).snapshots();
}