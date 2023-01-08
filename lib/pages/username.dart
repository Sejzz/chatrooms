import 'dart:convert';

import 'package:chatrooms/pages/home.dart';
import 'package:chatrooms/pages/user.dart';
import 'package:chatrooms/service/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class usernamepage extends StatefulWidget {
  String username;
   usernamepage(  {Key? key,
      required this.username,
       
     })
      : super(key: key);


  @override
  State<usernamepage> createState() => _usernamepageState();
}

class _usernamepageState extends State<usernamepage> {

Stream<QuerySnapshot>? username;
  TextEditingController _username = TextEditingController();

  late SharedPreferences sharedPreferences;
  @override

//   void initState(){
//     super.initState();
//     initalGetSavedData();
//   }
//   void initalGetSavedData() async{
//     SharedPreferences.setMockInitialValues({});

//     sharedPreferences = await SharedPreferences.getInstance();
//      // Read the data, decode it and store it in map structure
//     Map<String,dynamic> jsondatais = 
//     jsonDecode(sharedPreferences.getString('userdata'));
//     //convert it into User object

//     User user = User.fromJson(jsondatais);
//     if(jsondatais.isNotEmpty){
//       print(user.username);
      
//       //set the sharedPreferences saved data to TextField
//       _username.value =  TextEditingValue(text: user.username);
//     }
//   }

// void storedata(){
//   User user = User(_username.text);
//   //we need to convert user obj to json format
//   String userdata = jsonEncode(user); 
//   //call class user and convert it to json
//   print(userdata);
//   sharedPreferences.setString('userdata', userdata);
// }
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromARGB(255, 123, 16, 173),
            Color.fromARGB(255, 41, 70, 236)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 220),
            child: Column(children: [
              Image.asset(
                "assets/images/white.png",
                height: 100,
                width: 150,
              ),
              SizedBox(
                height: 115,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _username,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28.0),
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28.0),
                          borderSide: const BorderSide(
                              width: 1,
                              style: BorderStyle.solid,
                              color: Colors.white)),
                      labelText: 'Create a Username',
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: 'Username',
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              
              Container(
                width: 200,
                height: 50,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  onPressed: () async{
                    final SharedPreferences sharedPreferences = 
                    await SharedPreferences.getInstance();
                    sharedPreferences.setString('username', _username.text);
                    savingUserData(){
                      DatabaseService().savingUserData(widget.username).then((value){
                        setState(() {
  username = value;
});
                      });
                    }
                    Navigator.push(context,  MaterialPageRoute(
      builder: (context) =>  home()
     // username()
                       )   );
                    
                   // Get.to(home());
                  //  print(_username.text);

                    //storedata();
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Color.fromARGB(255, 123, 16, 173),
                      fontSize: 20,
                      // fontWeight: FontWeight.normal
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.grey;
                      }
                      return Colors.white;
                    }),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                  ),
                  //style: ButtonStyle(backgroundColor: ,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
