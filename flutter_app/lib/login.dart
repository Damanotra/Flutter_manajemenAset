import 'package:flutter/material.dart';
import 'package:flutter_app/data.dart';
import 'package:flutter_app/dashboard.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login>{
  bool wrong_acc=false;
  String username = "";
  String password  = "";
  String message = "";
  bool waiting = false;
  final usernameController = new TextEditingController();
  final passwordController = new TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.person,
                      size: 32),
                  SizedBox(width: 18),
                  Expanded(
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          hintText: "Username"
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.lock,
                      size: 32),
                  SizedBox(width: 18),
                  Expanded(
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: "Password"
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      height: 40,
                      child: Text("Login",
                          style: TextStyle(color: Colors.white,
                              fontSize: 18)
                      ),
                      onPressed: (){
                        setState(() {
                          username = usernameController.text;
                          password = passwordController.text;
                          wrong_acc = false;
                          waiting = true;
                        });
                        checkData(username, password).then((value){
                          setState(() {
                            waiting = false;
                          });
                          if(value=="verified"){
                            Navigator.pushNamed(
                              context,
                              Dashboard.routeName,
                            );
                          }
                          else{
                            setState(() {
                              wrong_acc=true;
                              message = value;
                            });

                          }
                        },onError: (error) {
                          print(error);
                        });
                      },
                      color: Colors.blue
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(height: 10,),
              wrong_acc ? Text(message)
                  :
              SizedBox(),
              //waiting ? Text("Please wait") : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}