import 'package:chatrooms/pages/username.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseService {
  final String? username;
  DatabaseService({this.username});

 // reference for our collections
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("username");
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("friends");
      final CollectionReference groupCollection1 =
      FirebaseFirestore.instance.collection("football");
final CollectionReference groupCollection2 =
      FirebaseFirestore.instance.collection("photography");
final CollectionReference groupCollection3 =
      FirebaseFirestore.instance.collection("study");
final CollectionReference groupCollection4 =
      FirebaseFirestore.instance.collection("travel");
final CollectionReference groupCollection5 =
      FirebaseFirestore.instance.collection("painting");


      
  // saving the userdata
  Future savingUserData(String username) async {
    return await userCollection.doc(username).set({
      "username": username,
     
    });
  }

  // getting user data
  Future gettingUserData(String username) async {
    QuerySnapshot snapshot =
        await userCollection.where("username", isEqualTo: username).get();
    return snapshot;
  }

  // get user groups
  getUserGroups(String username) async {
    return userCollection.doc(username).snapshots();
  }

  

  // getting the chats
  getChats(String groupId) async {
    return groupCollection
        .doc(groupId)
        .collection("messages")
        .orderBy("time")
        .snapshots();
  }
  getChats1(String groupId) async {
    return groupCollection1
        .doc(groupId)
        .collection("messages")
        .orderBy("time")
        .snapshots();
  }

// creating a group
  // Future createGroup(String userName, String id, String groupName) async {
  //   DocumentReference groupDocumentReference = await groupCollection.add({
  //     "groupName": groupName,
  //     "groupIcon": "",
  //     "admin": "${id}_$userName",
  //     "members": [],
  //     "groupId": "",
  //     "recentMessage": "",
  //     "recentMessageSender": "",
  //   });
  //   // update the members
  //   await groupDocumentReference.update({
  //     "members": FieldValue.arrayUnion(["${uid}_$userName"]),
  //     "groupId": groupDocumentReference.id,
  //   });

  //   DocumentReference userDocumentReference = userCollection.doc(uid);
  //   return await userDocumentReference.update({
  //     "groups":
  //         FieldValue.arrayUnion(["${groupDocumentReference.id}_$groupName"])
  //   });
  // }
  // Future getGroupAdmin(String groupId) async {
  //   DocumentReference d = groupCollection.doc(groupId);
  //   DocumentSnapshot documentSnapshot = await d.get();
  //   return documentSnapshot['admin'];
  // }

  // // get group members
  // getGroupMembers(groupId) async {
  //   return groupCollection.doc(groupId).snapshots();
  // }

  // // search
  // searchByName(String groupName) {
  //   return groupCollection.where("groupName", isEqualTo: groupName).get();
  // }

  // // function -> bool
  // Future<bool> isUserJoined(
  //     String groupName, String groupId, String userName) async {
  //   DocumentReference userDocumentReference = userCollection.doc(username);
  //   DocumentSnapshot documentSnapshot = await userDocumentReference.get();

  //   List<dynamic> groups = await documentSnapshot['groups'];
  //   if (groups.contains("${groupId}_$groupName")) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // toggling the group join/exit
  Future toggleGroupJoin(
      String groupId, String userName, String groupName) async {
    // doc reference
    DocumentReference userDocumentReference = userCollection.doc(username);
    DocumentReference groupDocumentReference = groupCollection.doc(groupId);

    DocumentSnapshot documentSnapshot = await userDocumentReference.get();
    List<dynamic> groups = await documentSnapshot['groups'];

    // if user has our groups -> then remove then or also in other part re join
    if (groups.contains("${groupId}_$groupName")) {
      await userDocumentReference.update({
        "groups": FieldValue.arrayRemove(["${groupId}_$groupName"])
      });
      await groupDocumentReference.update({
        "members": FieldValue.arrayRemove(["${username}_$userName"])
      });
    } else {
      await userDocumentReference.update({
        "groups": FieldValue.arrayUnion(["${groupId}_$groupName"])
      });
      await groupDocumentReference.update({
        "members": FieldValue.arrayUnion(["${username}_$userName"])
      });
    }
  }

  // send message
  sendMessage(String groupId, String obtainedusername, Map<String, dynamic> 
  chatMessageData) async {
    userCollection.doc(obtainedusername).collection("sender");
    groupCollection.doc(groupId).collection("messages")
    .add(chatMessageData);
    userCollection.doc(obtainedusername).update({
      "recentMessage": chatMessageData['message'],
      "recentMessageSender": chatMessageData['obtainedusername'],
      "recentMessageTime": chatMessageData['time'].toString(),
    });
    groupCollection.doc(groupId).update({
      "recentMessage": chatMessageData['message'],
      "recentMessageSender": chatMessageData['obtainedusername'],
      "recentMessageTime": chatMessageData['time'].toString(),
    });
  }
}