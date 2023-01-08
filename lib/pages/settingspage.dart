import 'package:chatrooms/pages/FirestoreConstants.dart';

import 'package:chatrooms/pages/settingprovider.dart';
import 'package:chatrooms/pages/user_chat.dart';
import 'package:chatrooms/pages/username.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'FirestoreConstants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class SettingsPagestate extends StatefulWidget {
  const SettingsPagestate({super.key});

  @override
  State<SettingsPagestate> createState() => _SettingsPagestateState();
}

class _SettingsPagestateState extends State<SettingsPagestate> {

   TextEditingController ? _username;

   //final  TextEditingController _username = TextEditingController();
   String username = '';

   late SettingProvider settingProvider;

   final FocusNode focusNodeUsername = FocusNode();
   
  

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    settingProvider = context.read<SettingProvider>();
    readLocal();
  }

  void readLocal(){
setState(() {
  username = settingProvider.getPref(FirestoreConstants.name) ?? "";
});
  
UserChat updateInfo = UserChat(name: username);
settingProvider.updateDataFirestore(
  FirestoreConstants.pathUserCollection, 
  username, updateInfo.toJson());
  } 
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}