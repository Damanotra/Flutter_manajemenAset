import 'package:flutter_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data.dart';
import 'package:flutter_app/jadwal.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("Jenis Aset"),
      ),
      body: Center(
        child: FutureBuilder(
            future: getAllJenis(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    padding: EdgeInsets.all(20),
                    itemCount: snapshot.data.length * 2,
                    itemBuilder: (context, i) {
                      if (i.isOdd)
                        return Divider(
                          color: Colors.black,
                        );
                      final index = i ~/ 2;
                      return GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            snapshot.data[index]['nama'].toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            JadwalScreen.routeName,
                            arguments:
                            ArgumentsId(snapshot.data[index]['id']),
                          );
                        },
                      );
                    });
              } else if (snapshot.hasError) {
                return new Text(snapshot.error.toString());
              }
              else{
                return Text("Please wait");
              }
            }),
      ),
    );
  }
}