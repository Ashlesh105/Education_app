import 'package:flutter/material.dart';

class TopicWidget extends StatefulWidget {
  final double height;
  final double width;
  final Map<String, dynamic> jsonData;
  final String text;

  TopicWidget({
    Key? key,
    required this.text,
    required this.jsonData,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  State<TopicWidget> createState() => _TopicWidgetState();
}

class _TopicWidgetState extends State<TopicWidget> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void navigateToNotesPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NotesPage(jsonData: widget.jsonData, onDonePressed: () { Navigator.pop(context); },),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 2.0)],
        ),
        child: Column(
          children: [
            Text(
              widget.text,
              style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,
            ),
            Divider(
              color: Colors.black,
            ),
            GestureDetector(
              onTap: navigateToNotesPage,
              child: Column(children: [Icon(Icons.book, size: widget.height / 2),Text('Notes',style: TextStyle(fontSize: 20),)],)
            ),
            // Adjust spacing
            GestureDetector(
              onTap: toggleFavorite,
              child: Container(
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  color: isFavorite ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.favorite,
                  color: isFavorite ? Colors.black : Colors.grey,
                  size: 36,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotesPage extends StatelessWidget {
  final Map<String, dynamic> jsonData;
  final Function() onDonePressed;

  NotesPage({required this.jsonData, required this.onDonePressed});

  @override
  Widget build(BuildContext context) {
    // Use jsonData to display content on this page
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                jsonData['title'],
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                jsonData['explanation'],
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Code Snippet:',
                style: TextStyle(fontSize:20, fontWeight: FontWeight.bold,),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  jsonData['codeSnippet'],
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 25,top: 10),
              child: Container(height:60,alignment: Alignment.bottomRight,child: ElevatedButton(onPressed: onDonePressed, child: Text('Done',style: TextStyle(fontSize: 20),))),
            )
          ],
        ),
      ),
    );
  }
}
