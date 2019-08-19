import 'package:flutter/material.dart';
import 'package:flutter_app/data.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/dashboard.dart';
import 'package:flutter_app/jadwal.dart';
import 'package:flutter_app/form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes: {JadwalScreen.routeName: (context) => JadwalScreen(),
      Dashboard.routeName: (context)=>Dashboard(),
        FormScreen.routeName:(context)=>FormScreen()
      },
      home: FormRowScreen(),
    );
  }
}

class FormRowScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormRowScreenState();
}

class FormRowScreenState extends State<FormRowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            child: Container(
              alignment: FractionalOffset.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: FutureBuilder(
                future: getAsetById(1.toString()),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(snapshot.data['merk'].toString()),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(snapshot.data['lokasi'].toString()),
                          ],
                        )
                      ],
                    );
                  }
                  else if(snapshot.hasError){
                    return Text(snapshot.error.toString());
                  }
                  else{
                    return Text("Please wait");
                  }
                },
                ),
              ),
              color: Color.fromRGBO(100, 181, 246, 0.6),
              height: 200,

            ),
            width: double.infinity,
          )
        ],
      ),
    );
  }
}






