import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginapp/Homepage.dart';
class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

// ignore: camel_case_types
class _signupState extends State<signup> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey= GlobalKey<FormState>();
  String _email,_password,_name;
  checkauthentication()async{
    _auth.authStateChanges().listen((user) async{
      if(user!=null)
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Homepage()));
        }
    });
  }
  @override
  void initState()
  {
    super.initState();
    this.checkauthentication();
  }
  signup()async
  {
    if(_formkey.currentState.validate())
      {
        _formkey.currentState.save();
      }
    try
        {
          UserCredential user =await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
          if(user!=null)
            {
              await _auth.currentUser.updateProfile(displayName: _name);

            }
        }
    catch(e)
    {
        showError(e.message);
    }
  }
  showError(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ERROR'),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 500,
                  child: Image(
                    image: AssetImage("images/home.png"),
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                            // ignore: missing_return
                            validator: (input) {
                              if (input.isEmpty) return 'Enter Name';
                            },
                            decoration: InputDecoration(
                              labelText: 'Name',
                              prefixIcon: Icon(Icons.person),
                            ),
                            onSaved: (input) => _name = input,
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            // ignore: missing_return
                            validator: (input) {
                              if (input.isEmpty) return 'Enter Email';
                            },
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email),
                            ),
                            onSaved: (input) => _email = input,
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            // ignore: missing_return
                            validator: (input) {
                              if (input.length < 6)
                                return 'Provide Minimum 6 Character';
                            },
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                            ),
                            obscureText: true,
                            onSaved: (input) => _password = input,
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          onPressed: signup,
                          child: Text(
                            'SIGNUP',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

