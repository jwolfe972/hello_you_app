import 'package:flutter/material.dart';

void main() => runApp(new MyApp());



class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {




    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Trip Cost",
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
  String distanceAmnt = "";
  final _currentStr = ['Dollars', 'Euro', 'Pounds'];
  String _currency = 'Dollars';
  final double _formDistance = 5.0;
  TextEditingController distanceController = new TextEditingController();
  TextEditingController avgController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle tS = Theme.of(context).textTheme.headline6;


    return Scaffold(
      appBar: AppBar(
        title: Text("Trip Cost"),
        // backgroundColor: Colors.pinkAccent,


      ),

      body: Container(
        color: Colors.red,
        padding: EdgeInsets.all(15.0),
        child: Column(children: <Widget> [


          Expanded( child: TextField(
            controller: avgController,

            decoration: InputDecoration(

              labelText: 'Distance per unit',
              hintText: 'e.g. 124',
              labelStyle: tS,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
              ),
            ),

              //
              // onChanged: (String s){
              //
              //
              //
              //
              //   setState(() {
              //     name = s;
              //   });
              //
              //
              //   if(name == "shit"){
              //     name = "you are banned!!";
              //   }
              // }

              keyboardType: TextInputType.number

          )),

          Padding(
            padding: EdgeInsets.only( top: _formDistance, bottom: _formDistance ) ,
          ),
          Expanded( child: TextField(
            controller: distanceController,
            decoration: InputDecoration(
              labelText: 'Distance',
              hintText: 'e. g. 17 ',
              labelStyle: tS,
              border: OutlineInputBorder(
                borderRadius:  BorderRadius.circular(5.0)
              ),
              


            ),
            keyboardType: TextInputType.number,


          )),


          Padding(
            padding: EdgeInsets.only( top: _formDistance, bottom: _formDistance ) ,
          ),


      Row(children: <Widget>[


        Expanded(child: TextField(
          controller: priceController,
          decoration: InputDecoration(
            labelText: 'Price',
            hintText: 'e. g. 1.65 ',
            labelStyle: tS,
            border: OutlineInputBorder(
                borderRadius:  BorderRadius.circular(5.0)
            ),



          ),
          keyboardType: TextInputType.number,


        )),

        SizedBox(width: _formDistance,),
        DropdownButton<String>(

          items: _currentStr.map((value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          )).toList(),
          onChanged: (String value){

            _onDropDownChanged(value);

          },
          value: _currency,






        ),

      ]),



          Expanded( child: Row(children: <Widget>[





            ButtonTheme(
                minWidth: 20.0,
                height: 20.0,
                child: RaisedButton(
                  color: Theme.of(context).primaryColorDark,
                  textColor: Theme.of(context).primaryColorLight,

                  child: (
                      Text('Submit', textScaleFactor: 1.5,)
                  ),

                  onPressed: (){
                    setState(() {


                      distanceAmnt = _calculate();



                    });
                  },


                )),
            SizedBox(width: _formDistance,),

            ButtonTheme(
                minWidth: 20.0,
                height: 20.0,
                child: RaisedButton(
                  color: Theme.of(context).buttonColor,
                  textColor: Theme.of(context).primaryColorDark,

                  child: (
                      Text('Reset', textScaleFactor: 1.5,)
                  ),

                  onPressed: (){
                    setState(() {



                      _reset();


                    });
                  },


                )),



          ],)),






          Text(distanceAmnt),



          // Text('Hello ' + name + '!')





        ],),
      ),
    );







    throw UnimplementedError();
  }


  void _onDropDownChanged(String s){


    setState(() {
      this._currency = s;
    });
  }


  String _calculate(){
    double _distance = double.parse(distanceController.text);
    double _fuelcost = double.parse(priceController.text);
    double _consumption = double.parse(avgController.text);



    double _totalCost = (_consumption * _fuelcost) / _distance ;
    String rs = 'The total cost for your trip is ' + _totalCost.toStringAsFixed(2) + ' ' + _currency ;


    return rs;
  }



  void _reset(){


    distanceController.text = '';
    avgController.text = '';
    priceController.text = '';


    setState(() {
      distanceAmnt = '';
    });







  }
}

