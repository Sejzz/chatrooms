import 'package:flutter/material.dart';

class painting extends StatefulWidget {
  const painting({super.key});

  @override
  State<painting> createState() => _paintingState();
}

class _paintingState extends State<painting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Art'),
        backgroundColor: Color.fromARGB(255, 123, 16, 173),
       // elevation: 0,
      ),
      body: SafeArea(child: 
      Container(
        child: Column(children: [
          Expanded(child: Container()
          ),

          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Row(
              children: [
                Flexible(child: TextField(
                  decoration: InputDecoration( 
                    
                    border: InputBorder.none, 
                    hintText: "Enter message"
                  ),
                ),
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.send, 
                color: Color.fromARGB(255, 137, 53, 175), ))
              ],
            ),
          )
        ],),
      )),
    );
  }
}