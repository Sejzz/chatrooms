import 'package:chatrooms/pages/home.dart';
import 'package:chatrooms/pages/settingprovider.dart';
import 'package:chatrooms/pages/username.dart';
import 'package:chatrooms/service/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';




class splash extends StatefulWidget {
   final String username;
 const splash(  {Key? key,
      required this.username,
       
     })
      : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  Stream<QuerySnapshot>? username;
   late var  finalusername;
  @override
  void initState(){

    super.initState();
    getValidationData().whenComplete(() async{
       _navigatetousername();
    },);
   
    
  }

  _navigatetousername()async{
    await Future.delayed(Duration(milliseconds: 2500), (){

    });
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => finalusername == null ? usernamepage(username: '',) : home()
     // username()
      ));
  }

  Future getValidationData() async{
    final SharedPreferences getPref = 
    await SharedPreferences.getInstance();
    var obtainedusername =getPref.getString('username');
    
    setState(() {
      finalusername = obtainedusername;
       savingUserData(){
                      DatabaseService().savingUserData(widget.username).then((value){
                        setState(() {
  username = value;
  
});
                      });
                    }
      gettingUserData(){
   DatabaseService().gettingUserData(widget.username).then((obtainedusername) {
      setState(() {
        username = obtainedusername;
          
      });
    });
 }
    });
  //  print(finalusername);
    print(obtainedusername);
  }
  

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SettingProvider>(
  create: (_) => SettingProvider(
    sharedPreferences: this.finalusername,
    firebaseFirestore: this.finalusername,
    firebaseStorage: this.finalusername,
  )
),

      ],
      child: Scaffold(
        body: 
         Center(
           child: 
           Container( padding: EdgeInsets.only(top: 320),
            child: Column(children: [
                Image.asset(
                  "assets/images/CHATROOM.png",
                  height: 100,
                  width: 150,
               
             )  ]
           )
            ),
         ) ),
    );
  }
}