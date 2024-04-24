import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sih/con.dart';
import 'package:flutter/material.dart';
import 'package:sih/use/textfield.dart';
import 'package:sih/homepages/wallpost.dart';
class homepages extends StatefulWidget {
  const homepages({super.key});

  @override
  State<homepages> createState() => _homepageState();
}

class _homepageState extends State<homepages> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final textcontroller =TextEditingController();




  void postMessage(){
    if (textcontroller.text.isNotEmpty){
      FirebaseFirestore.instance.collection("user post").add({
        'userEmail': currentUser.email,
        'Message': textcontroller.text,
        'TimeStamp': Timestamp.now(),
        'Likes': [],

      });
    }
    setState(() {
      textcontroller.clear();
    });


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Container(

        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [g3,g4])
        ),

        child: Column(
          children: [
            Expanded(child: StreamBuilder(

              stream: FirebaseFirestore.instance.collection("user post").orderBy("TimeStamp",descending: false).snapshots(),
              builder: (context ,snapshot){
                if (snapshot.hasData){
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context,index){
                      final post = snapshot.data!.docs[index];
                      return wallposts(message: post['Message'], user: post['userEmail'],postid: post.id,likes: List<String>.from(post['Likes'] ?? []),

                      );
                    },
                  );
                }else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error:${snapshot.error}'),
                  );
                }
                return const Center(child: CircularProgressIndicator(),
                );
              },
            ),
            ),



            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(

                children: [
                  Expanded(child: Mytextfield(controller: textcontroller, hintText: "Write a Message", obscureText: false,
                  ),
                  ),
                  IconButton(onPressed: postMessage, icon: const Icon(Icons.arrow_circle_up),
                  )
                ],
              ),
            ),

            Text("logged in as:" + currentUser.email!),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}