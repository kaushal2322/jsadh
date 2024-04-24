import 'package:flutter/material.dart';
import 'package:sih/homepages/chatroom.dart';
import 'package:sih/homepages/habit.dart';
import 'package:sih/homepages/note.dart';
import 'package:sih/homepages/plant_screen.dart';
import 'package:sih/homepages/video.dart';





class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  int _selectedIndex=0;
  void _navbar(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  final List<Widget> _pages =[
    HomePage(),
    DrawingBoard(),
    homepages(),
    PlantScreen(),
    video(),







  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      appBar: AppBar(title: Text("EduElite",
      style: TextStyle(color: Colors.white,),),
        backgroundColor: Colors.deepPurple[400],
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navbar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.work_history), label: 'Habit Tracker'),
          BottomNavigationBarItem(icon: Icon(Icons.note),label: 'Notenest'),
          BottomNavigationBarItem(icon: Icon(Icons.message),label: 'Chat mate'),
          BottomNavigationBarItem(icon: Icon(Icons.timelapse),label: 'Pomodoro Pro'),
          BottomNavigationBarItem(icon: Icon(Icons.video_call),label: 'Studystream'),


        ],

      ),



      drawer: Drawer(
      ),
    );
  }
}
