import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController heightc = TextEditingController();
  TextEditingController weightc = TextEditingController();
  double bmivalue=0.00;

  void calcbmi(double height,double weight){
    setState(() {
      bmivalue = (weight*10000)/(height*height);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.brown[100],
        body: Center(
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Container(
               width: double.infinity,
               padding: EdgeInsets.all(15),
               decoration: BoxDecoration(
                 color: Colors.brown[500],
                //  borderRadius: BorderRadius.all(Radius.circular(20)),
                 boxShadow: [BoxShadow(
                   color: Colors.brown,
                   offset: const Offset(
                     5.0, 5.0) ,
                     blurRadius: 10.0,
                     spreadRadius: 2.0
                 )
                 ]
               ),
              child:
              Center(child: Text("BMI CALCULATOR",style: TextStyle(color: Colors.brown[50],fontSize: 25,),)),
             ),
            
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 Container(
                 margin: EdgeInsets.all(10),
               width: 60,
               child:  Image.asset('assets/images/height.png',),
             ),
              Container(
                    width: 120,
                     margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: heightc,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
                      decoration: InputDecoration(
                        hintText: "height (in cm)",
                      ),
                    ),
                  ),],),
                 Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 Container(
                 margin: EdgeInsets.all(10),
               width: 60,
               child:  Image.asset('assets/images/weight.png',),
             ),
              Container(
               margin: EdgeInsets.all(10),
                    width: 120,
                    child: TextField(
                      controller: weightc,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
                      decoration: InputDecoration(
                        hintText: "weight (in kg)"
                      ),
                    ),
                  ),],),
                 
                ],
              ),
              ElevatedButton(onPressed: () {
                calcbmi(double.parse(heightc.text), double.parse(weightc.text));
              
              },
              style: ElevatedButton.styleFrom(
              primary: Colors.brown[600],
              padding: EdgeInsets.all(16),
              shadowColor: Colors.red[400],
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
              textStyle: TextStyle(fontSize: 20,)),
              child: Text("CALCULATE",),
              ),
              Container(
              
              alignment: Alignment.center,
              padding: EdgeInsets.all(15),
              width: 200,
               decoration: BoxDecoration(
                 color: Colors.brown[500],
                //  borderRadius: BorderRadius.all(Radius.circular(20)),
                 boxShadow: [BoxShadow(
                   color: Colors.black45,
                   offset: const Offset(
                     2.0, 2.0) ,
                     blurRadius: 5.0,
                     spreadRadius: 1.0
                 )
                 ]
               ),
              child: Text(bmivalue.toStringAsFixed(2),style: TextStyle(fontSize: 18,color: Colors.white),),)
            ],
          ),
        ),
      ),
    )
    ;
  }
}