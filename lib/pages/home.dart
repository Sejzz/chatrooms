
import 'package:chatrooms/chatrooms/football.dart';
import 'package:chatrooms/chatrooms/friends_gossip.dart';

import 'package:chatrooms/chatrooms/painting.dart';
import 'package:chatrooms/chatrooms/photography.dart';
import 'package:chatrooms/chatrooms/study.dart';
import 'package:chatrooms/chatrooms/travel.dart';
import 'package:chatrooms/pages/user.dart';
import 'package:chatrooms/pages/username.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;
  final items = const[Icon(Icons.group,
  color: Colors.white,),
 
  Icon(Icons.book,
  color: Colors.white,),
  Icon(Icons.brush,
  color: Colors.white,),
  Icon(Icons.camera_alt,
  color: Colors.white,),
  Icon(Icons.sports_football,
  color: Colors.white,),
   Icon(Icons.airplanemode_active,
  color: Colors.white,),
 
 
  ];

   //var obtainedusername = sharedPreferences.getString('username');
 // get finalusername => obtainedusername;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('CHATROOMS'),
      //   backgroundColor: Color.fromARGB(255, 123, 16, 173),
      //  // elevation: 0,
      // ),
      
    bottomNavigationBar:  CurvedNavigationBar(
        
        key: navigationKey,
        color: const Color.fromARGB(255, 123, 16, 173),
        backgroundColor: Colors.grey.shade200,
        animationDuration: const Duration(milliseconds: 300),
        index: index,
        onTap: (selectedIndex) => setState(() {
          index = selectedIndex;
        }),
        items: items,
    
      ),
       body: Container(
      
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: getSelectedWidget(index: index),
        ),
              

         
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //      // Text('hello $finalusername'),
      //       MaterialButton(
      //         color: Colors.purpleAccent,
      //       child: Text('Remove Account'),
      //       onPressed: () async{
      //           final SharedPreferences sharedPreferences = 
      //               await SharedPreferences.getInstance();
      //               sharedPreferences.remove('username');
      //                Navigator.push(context,  MaterialPageRoute(
      // builder: (context) =>  username()));

      //     })],
      //   ),
      // ),
    );
  }
}
 Widget getSelectedWidget({required int index }){
    Widget widget;
    switch(index){
      case 0:
      widget =  const friends(obtainedusername: 'username', groupId: 'val',

      // firebaseUser: widget.firebaseUser,
      //  targetUser: username,
      //  userModel: widget.User,
      //  chatroom: null, 
       );
      break;
 
      case 1:
      widget = const study();
      break;
      case 2:
      widget = const painting();
      break;
       case 3:
      widget = const photography();
      break;
       case 4:
      widget = const football(groupId: '', obtainedusername: '',);
      break;
       case 5:
      widget = const travel();
      break;
       

      default:
      widget = const friends(obtainedusername: 'username', groupId: 'val',);
      break;

    }
    return widget;
  }
