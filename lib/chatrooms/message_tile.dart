import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessageTile extends StatefulWidget {
  final String message;
  final String obtainedusername;
  final bool sentByMe;

  const MessageTile(
      {Key? key,
      required this.message,
      required this.obtainedusername,
      required this.sentByMe})
      : super(key: key);

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
   @override
  // void initState(){

  //   super.initState();
  //   getValidationData().whenComplete(() async{
     
  //   },);
   
    
  // }
    late var  finalusername;

  // Future getValidationData() async{
  //   final SharedPreferences sharedPreferences = 
  //   await SharedPreferences.getInstance();
  //   var obtainedusername = sharedPreferences.getString('username');
  //   setState(() {
  //     finalusername = obtainedusername;
      
  //   });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 4,
          bottom: 4,
          left: widget.sentByMe ? 0 : 24,
          right: widget.sentByMe ? 24 : 0),
      alignment: widget.sentByMe ? Alignment.centerRight : 
      Alignment.centerLeft,
      child: Container(
        //color: Color.fromARGB(255, 123, 16, 173),
        margin: widget.sentByMe
            ? const EdgeInsets.only(left: 30)
            : const EdgeInsets.only(right: 30),
        padding:
            const EdgeInsets.only(
              top: 17, bottom: 17, left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: widget.sentByMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )
                : const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
            color: widget.sentByMe
                ? Color.fromARGB(255, 123, 16, 173)
                : Colors.grey[700]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
           // Text(widget.sentByMe,
           // ),
            Text(
              widget.obtainedusername.toUpperCase(),
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: -0.5),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(widget.message,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 16, color: Colors.white))
          ],
        ),
      ),
    );
  }
}


//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     _MessageTileState createState() => _MessageTileState();
//     throw UnimplementedError();
//   }
// 