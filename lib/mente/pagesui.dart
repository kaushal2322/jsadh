import 'package:flutter/material.dart';

import 'package:sih/use/use.dart';
import 'package:velocity_x/velocity_x.dart';


class pagess extends StatefulWidget {
  const pagess({super.key});

  @override
  State<pagess> createState() => _pagessState();
}

class _pagessState extends State<pagess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Vx.white,Vx.white])
        ),
        child: Column(
            children: <Widget>[
              logoWidget("assets/images/sih6.jpg"),
              SizedBox(height: 20,),
              Text('Erito devlopers',style: TextStyle(
                fontSize: 20
              ),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [

                      Text('Posts',style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: 16.0
                      ),),
                      Text('12',style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: 16.0
                      ),),

                    ],
                  ),
                  SizedBox(width: 24.0,),
                  Column(
                    children: [

                      Text('Followers',style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: 16.0
                      ),),
                      Text('155k',style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: 16.0
                      ),),

                    ],
                  ),
                  SizedBox(width: 24.0,),
                  Column(
                    children: [

                      Text('Following',style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: 16.0
                      ),),
                      Text('120',style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: 16.0
                      ),),

                    ],
                  ),
                  SizedBox(width: 24.0,),

                ],
              ),
              SizedBox(height: 30,),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text('     About',style: TextStyle(
                   fontSize: 20,
                 ),)
               ],
             ),



              SizedBox(height: 50,),
              Text('Erito Developers is a pioneering EdTech company committed to democratizing education and revolutionizing the learning landscape. Founded on the principles of accessibility and efficiency, Erito is driven by a passionate team of educators and tech enthusiasts. With a mission to empower learners of all backgrounds, they have harnessed cutting-edge technology to create innovative, user-friendly platforms that make education accessible to everyone. Their visionary approach to learning harnesses personalized algorithms, interactive content, and adaptive methodologies to optimize knowledge acquisition. Erito Developers is at the forefront of shaping a future where education knows no bounds, fostering brighter prospects fo learners worldwide.',style: TextStyle(
                  fontSize: 16,
              ),),



            ],

        ),




      ),


    );
  }
}
