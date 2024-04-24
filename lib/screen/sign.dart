import 'package:flutter/material.dart';
import 'package:sih/con.dart';
import 'package:sih/use/use.dart';
import 'package:sih/screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(

        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [g1,g2])
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20,MediaQuery.of(context).size.height*0.2,20,0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/sih4.jpg"),
                //text field
                SizedBox(height: 20,),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _userNameTextController),

                SizedBox(height: 20,),


                reusableTextField("Enter Email Id", Icons.person_outline, false, _emailTextController),
                SizedBox(height: 20,),
                reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),

                SizedBox(height: 20,),
                signinsignupbutton(context, false, (){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text)
                      .then((value){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));

                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });




                })






              ],
            ),
          ),
        ),








      ),







    );
  }
}
