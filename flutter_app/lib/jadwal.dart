import 'package:flutter_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data.dart';
import 'package:flutter_app/form.dart';


class JadwalScreen extends StatefulWidget{
  static const routeName = '/getJadwal';
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return JadwalScreenState();
  }
}


class JadwalScreenState extends State<JadwalScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final ArgumentsId args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Jadwal Screen"),
      ),
      body: Center(
        child: FutureBuilder(
          future: getFormByJenis(args.id),
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
                          snapshot.data[index]['waktu'].toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          FormScreen.routeName,
                          arguments:
                          ArgumentsDouble(snapshot.data[index]['id'],args.id),
                        );
                      },
                    );
                  });
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            else{
              return Text("Please wait");
            }
          },
        ),
      ),
    );
  }
}