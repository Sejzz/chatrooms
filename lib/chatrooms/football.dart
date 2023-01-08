import 'package:chatrooms/chatrooms/message_tile.dart';
import 'package:chatrooms/service/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/username.dart';

class football extends StatefulWidget {
  final String obtainedusername;
 // final String username;
   final String groupId;

  // final User targetUser;
  // final ChatRoomModel chatroom;
  // final User userModel;
  // final ChatRoomModel firebaseUser;

  //const friends({super.key, required this.targetUser, required this.chatroom, required this.userModel, required this.firebaseUser});
  
  
  const football(  {Key? key,

  required this.obtainedusername,
      //required this.username,
       required this.groupId,
     })
      : super(key: key);


  @override
  State<football> createState() => _footballState(obtainedusername: obtainedusername);
}

class _footballState extends State<football> {
  String obtainedusername;
   _footballState({required this.obtainedusername});
  Stream<QuerySnapshot>? chats;
  Stream<QuerySnapshot>? username;
   TextEditingController messageController = TextEditingController();

     @override
  void initState() {
    getChat();
   //gettingUserData();
    super.initState();
    Firebase.initializeApp().whenComplete(() { 
      print("completed");
      setState(() {});
    });
  }
 
   savingUserData(){
    DatabaseService().savingUserData(widget.obtainedusername).then((val) {
setState(() {
  username = val;
});
    });
  }
 gettingUserData(){
   DatabaseService().gettingUserData(widget.obtainedusername).then((val) {
      setState(() {
        username = val;
          
      });
    });
 }
  getChat() {
    DatabaseService().getChats1(widget.groupId).then((val) {
      setState(() {
        chats = val;
          
      });
    });
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.logout,
        color: Colors.white,
      ),
      onPressed: () async{
                 final SharedPreferences sharedPreferences = 
                    await SharedPreferences.getInstance();
                    sharedPreferences.remove('username');
                     Navigator.push(context,  MaterialPageRoute(
      builder: (context) =>  usernamepage(username: '',)));

          },
    )
  ],
        title: Text('football'),
        backgroundColor: Color.fromARGB(255, 123, 16, 173),
       // elevation: 0,
      ),
      body: SafeArea(child: 
      Container(
        child: Column(children: <Widget>[
          Expanded(
     // height: 200, // constrain height
      child: chatMessages(),
    ),
          // chatMessages(),
          // Expanded(child: Container()
          //),

          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Row(
              children: [
                Flexible(child: TextField(
                  controller: messageController,
                  decoration: InputDecoration( 
                    
                    border: InputBorder.none, 
                    hintText: "Enter message"
                  ),
                ),
                ),
                IconButton(onPressed: (){
                  sendMessage(
                    
                  );
                }, icon: Icon(Icons.send, 
                color: Color.fromARGB(255, 137, 53, 175), ))
              ],
            ),
          )
        ],),
      )),
    );
    
  }
  chatMessages(){
     return StreamBuilder(
      stream: chats,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  // QueryDocumentSnapshot qs = snapshot.data!.docs[index];
                  return MessageTile(
                  //  obtainedusername: widget.obtainedusername == qs['username'],
                   // widget.obtainedusername == qs['isername']
                   // widget.obtainedusername == qs['username'],
                      message: snapshot.data.docs[index]['message'],
                     obtainedusername: snapshot.data.docs[index]['sender'],
                      sentByMe: 
                    widget.obtainedusername ==
                          snapshot.data.docs[index]['sender']);
                },
              )
            : Container();
      },
    );
  }

  sendMessage() {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "message": messageController.text,
        "sender": widget.obtainedusername,
        "second_sender": widget.obtainedusername,
        "time": DateTime.now().millisecondsSinceEpoch,
      };

      DatabaseService().sendMessage(widget.groupId, widget.obtainedusername,chatMessageMap);
      setState(() {
        messageController.clear();
      });
    }
  }
  
}