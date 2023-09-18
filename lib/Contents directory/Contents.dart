import 'package:education_app1/Contents%20directory/Home.dart';
import 'package:flutter/material.dart';
import 'Course.dart';
import 'Quiz.dart';

void main() => runApp(const MaterialApp(
      home: ContentsPage(),
      debugShowCheckedModeBanner: false,
    ));

class ContentsPage extends StatefulWidget {
  const ContentsPage({super.key});

  @override
  State<ContentsPage> createState() => _ContentsPageState();
}

class _ContentsPageState extends State<ContentsPage> {
  int myIndex = 0; //setting the index of bottom bar
  List<Widget> widgetList = [ home(), Course(), Quiz()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.red, Colors.deepPurple])),
        child: Center(child: widgetList[myIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          //Bottom Navigation bar
          onTap: (index) {
            setState(() {
              myIndex = index; //onTap state changes based on index
            });
          },
          currentIndex:
              myIndex, //currentIndex will set to the initial index of the state
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_rounded), label: 'Course'),
            BottomNavigationBarItem(
                icon: Icon(Icons.quiz_outlined), label: 'Quiz'),
          ]),
    );
  }
}
