import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/start.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;
  // checkAuthentification(){
  //   // ignore: deprecated_member_use
  //   _auth.onAuthStateChanged.listen((user) {
  //     if (user == null) {
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => Start()));
  //     }
  //   });
  // }

  getuser() async {
    // User firebaseUser =  _auth.currentUser;
    // await firebaseUser?.reload();
    // firebaseUser = await _auth.currentUser;
    // if (firebaseUser != null) {
    //   setState(() {
    //     this.user = firebaseUser;
    //     this.isloggedin = true;
    //   });
    // }
    //User firebaseUser =  _auth.currentUser;
    //await firebaseUser?.reload();
    if ( FirebaseAuth.instance.currentUser != null) {
     // setState(() {
             this.user = FirebaseAuth.instance.currentUser;
             this.isloggedin = true;
           //});
    } else {
      print('no');
    }
    // if (firebaseUser != null) {
    //   setState(() {
    //     this.user = firebaseUser;
    //     this.isloggedin = true;
    //   });
    // }
  }
    signout() async {
      _auth.signOut();
    }
    // @override
    // void initState() {
    //   //this.checkAuthentification();
    //   this.getuser();
    // }
    @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    this.getuser();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: !isloggedin
              ? CircularProgressIndicator()
              : Column(
                  children: [
                    Container(
                      height: 400,
                      child: Image(
                          image: AssetImage("images/login1.png"),
                          fit: BoxFit.contain),
                    ),
                    Container(
                      child: Text(
                          //"Hello ${user.displayName} you are Logged in as ${user.email}",
                          "Hello world you are Logged in as ",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                      onPressed: signout,
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ],
                )),
    );
  }
}
