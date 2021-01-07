import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Homepage.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  checkAuthentication() async {
    // ignore: deprecated_member_use
    _auth.onAuthStateChanged.listen((user) {
      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      }
    });
    @override
    void initState() {
      super.initState();
      this.checkAuthentication();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 400,
            child: Image(
              image: AssetImage("images/login.jpg"),
              fit: BoxFit.contain,
            ),
          ),
          Container(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    child: TextFormField(
                        // ignore: missing_return
                        validator: (input) {
                          if (input.isEmpty) return 'Enter Email';
                          },
                      decoration:
                      InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      onSaved:
                      (input) => _email = input,
                    ),
                  ),
                  Container(
                    child: TextFormField(
                        // ignore: missing_return
                        validator: (input) {
                      if (input.length < 6)
                        return 'Provide Minimum 6 Character';},
                      decoration:
                      InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText:
                      true,
                      onSaved:
                      (input) => _password = input,
                    ),
                  ),
                  RaisedButton(
                      onPressed: () {},
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
