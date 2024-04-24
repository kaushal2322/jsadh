import 'package:sih/mente/pagesui.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sih/homepages/like.dart';
import 'package:firebase_auth/firebase_auth.dart';
class wallposts extends StatefulWidget {
  final String message;
  final String user;
  final String postid;
  final List<String> likes;


  const wallposts({super.key,required this.message,required this.user,required this.likes,required this.postid,});

  @override
  State<wallposts> createState() => _wallpostsState();
}

class _wallpostsState extends State<wallposts> {

  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;

  @override
  void initstate(){
    super.initState();
    isLiked = widget.likes.contains(currentUser.email);

  }

  void toggleLike(){
    setState(() {
      isLiked = !isLiked;
    });
    
    DocumentReference postRef =
        FirebaseFirestore.instance.collection('user post').doc(widget.postid);
    if(isLiked){
      postRef.update({
        'Likes': FieldValue.arrayUnion([currentUser.email])
      });
    } else{
      postRef.update({
        'Likes': FieldValue.arrayRemove([currentUser.email])
      });
    }
    
    
  }


  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(top: 25,left: 25, right: 25),
      padding: EdgeInsets.all(25),

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,color: Colors.white),
              padding: EdgeInsets.all(10),
              child: IconButton(
                icon:  const Icon(Icons.person, color: Colors.black,),
               onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => pagess() )
                  );
               },
              ),
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                rates(isLiked: isLiked, onTap: toggleLike,
                ),
                const SizedBox(height: 5),
                Text(widget.likes.length.toString(),

                ),

              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.user,

                  style: TextStyle(fontSize: 13,color: Colors.pink),

                ),
                const SizedBox(height: 10),
                Text(
                  widget.message,
                  style: TextStyle(fontSize: 12,),
                ),



              ],
            ),

            const SizedBox(width: 10),


          ],




        ),
      ),
    );
  }
}