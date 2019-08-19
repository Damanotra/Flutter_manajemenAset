import 'package:flutter/material.dart';
import 'package:flutter_app/data.dart';

class FormScreen extends StatefulWidget {
  static const routeName = '/form';
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final ArgumentsDouble args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: Center(
        child: FutureBuilder(
          future: getAsetByJenis(args.id2),
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
                          snapshot.data[index]['merk'].toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          null,
                          arguments: ArgumentsDouble(snapshot.data[index]['id'],args.id1),
                        );
                      },
                    );
                  });
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Text("Please wait");
            }
          },
        ),
      ),
    );
  }
}
