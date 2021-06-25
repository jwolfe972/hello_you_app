import 'package:flutter/material.dart';

void main() => runApp(new MyApp());



class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {



    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hello App",
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey

      ),


      home: MyHome(),
    );



    throw UnimplementedError();
  }




}

class MyHome  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HelloYouState();




    // throw UnimplementedError();



}

class _HelloYouState  extends State<MyHome>{

  String name = "";
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Hello You App"),
        backgroundColor: Colors.pinkAccent,

      ),

      body: Container(

        padding: EdgeInsets.all(15.0),
        child: Column(children: <Widget> [
          TextField(
            decoration: InputDecoration(
              hintText: 'ex: John ',
            ),
            onChanged: (String s){

              setState(() {
                name = s;
              });
            },

          ),
          Text('Hello ' + name + '!'),



        ],),
      ),
    );







    throw UnimplementedError();
  }
}

