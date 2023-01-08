import 'package:chatrooms/pages/FirestoreConstants.dart';
import 'package:flutter/material.dart';

class UserChat{
  String name;
  
  UserChat({
    required this.name
  });

  Map<String, String> toJson(){
    return{
      FirestoreConstants.name:name
    };
  }
  // factory UserChat.fromDocument(DocumentSnapshot doc){
  //   String name = "";
  // }

}