import 'package:flutter/material.dart';
import 'package:sih/con.dart';
import 'package:sih/use/use.dart';
import 'package:sih/screen/sign.dart';
import 'package:sih/screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
class   signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                SizedBox(height: 30,),
                reusableTextField("Enter Email", Icons.person_outline, false,
                    _emailTextController),

                SizedBox(height: 20,),


                reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
                SizedBox(height: 20,),

                signinsignupbutton(context, true, (){
                  FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text)
                  .then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen()));
                  }).onError((error, stackTrace) {
                    print("Error  ${error.toString()}");
                  });






                }),
                signUpOption(),


              ],
            ),
          ),
        ),
      ),





    );
  }
  //sign up
  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }






}
