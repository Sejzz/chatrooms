import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider{
  late final SharedPreferences sharedPreferences;
  late final FirebaseFirestore firebaseFirestore;
  late final FirebaseStorage firebaseStorage;

  SettingProvider({
    required this.sharedPreferences,
     required this.firebaseFirestore,
      required this.firebaseStorage,
  });


String? getPref(String key){
  return sharedPreferences.getString(key);
}
Future<bool> setPref(String key, String value) async{
  return await sharedPreferences.setString(key, value);
}

 Future<void> updateDataFirestore(String collectionPath, String path, 
 Map<String, String> dataNeedUpdate 
 ){
  return firebaseFirestore.collection(collectionPath).doc(path)
  .update(dataNeedUpdate);
 }

  // final SharedPreferences sharedPreferences = 
  //                   await SharedPreferences.getInstance();
  //                   sharedPreferences.setString(
  //                     'username', _username.text);
  }
  
