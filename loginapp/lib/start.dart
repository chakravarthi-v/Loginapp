import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:loginapp/Login.dart';
import 'Login.dart';
import 'signup.dart';
class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  navigatotologin()async{
    Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
  }
  navigatotoregister()async{
    Navigator.push(context, MaterialPageRoute(builder: (context)=> signup()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(height: 35.0),
            Container(
              height: 400,
              child: Image(
                image: AssetImage("images/Start.png"),
              ),
            ),
            SizedBox(height: 20.0),
            RichText(
              text: TextSpan(
                  text: 'Welcome to ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'BuddyBook',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Good Linkage Not Breakage',
              style: TextStyle(color: Colors.black,fontSize: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  padding:EdgeInsets.only(left: 30,right: 30),
                  onPressed: navigatotologin,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.black,
                ),
                SizedBox(
                  width: 30.0,
                ),
                RaisedButton(
                  padding:EdgeInsets.only(left: 30,right: 30),
                  onPressed: navigatotoregister,
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.black,
                ),
                SizedBox(height: 20.0,),
              ],
            ),
            SizedBox(height: 20.0,),
            SignInButton(
              Buttons.Google,
              text: "Sign up with Google",
              onPressed: () {},
            ),
            SizedBox(height: 20.0,),
              SignInButton(
              Buttons.Facebook,
              text: "Sign up with Facebook",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
