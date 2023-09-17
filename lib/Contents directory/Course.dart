import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
class DataList {
  final String title;
  final List<DataList> children;

  DataList(this.title, [this.children = const <DataList>[]]);
}

class EndDrawer extends StatelessWidget {
  final List<DataList> data;

  EndDrawer({required this.data});

  Widget _buildExpandableList(List<DataList> dataList, BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: dataList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: _buildExpansionTile(dataList[index], context),
          ),
        );
      },
    );
  }

  Widget _buildExpansionTile(DataList dataList, BuildContext context) {
    return ExpansionTile(
      title: Text(dataList.title),
      children: _buildChildren(dataList.children, context),
    );
  }

  List<Widget> _buildChildren(List<DataList> children, BuildContext context) {
    List<Widget> widgets = [];

    for (var child in children) {
      if (child.children.isEmpty) {
        widgets.add(_buildListTile(child, context));
      } else {
        widgets.add(_buildExpansionTile(child, context));
      }
    }

    return widgets;
  }

  Widget _buildListTile(DataList dataList, BuildContext context) {
    return ListTile(
      title: Text(dataList.title),
      onTap: () {
        // Handle item tap
        Navigator.of(context).pop(); // Close the drawer
        // You can add navigation logic here
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black, // Set the background color to black
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                  child: Text(
                    'SYLLABUS VIEW',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ),
            _buildExpandableList(data, context),
          ],
        ),
      ),
    );
  }
}
void main() {
  runApp( Course());
}

class Course extends StatelessWidget {
  const Course({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,

      home: const CouresPage(),
    );
  }
}

class CouresPage extends StatefulWidget {
  const CouresPage({Key? key}) : super(key: key);

  @override
  State<CouresPage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CouresPage> {
  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/contents.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  void initState() {
    super.initState();
    // Call the readJson method when the app starts
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    final List<DataList> data = <DataList>[
      DataList('Basics of C Programming', <DataList>[
        DataList('Introduction to C', <DataList>[
          DataList('History and significance'),
          DataList('Structure of a C program'),
          DataList('Writing and running your first program'),
        ]),
        DataList('Data Types and Variables', <DataList>[
          DataList('Integer types (int, short, long)'),
          DataList('Floating-point types (float, double)'),
          DataList('Character type (char)'),
          DataList('Constants and variables'),
          DataList('Variable declaration and initialization'),
        ]),
        DataList('Operators and Expressions', <DataList>[
          DataList('Arithmetic operators (+, -, *, /, %)'),
          DataList('Assignment operators (=, +=, -=, *=, /=, %=)'),
          DataList('Relational operators (==, !=, <, >, <=, >=)'),
          DataList('Logical operators (&&, ||, !)'),
          DataList('Increment (++) and decrement (--)'),
          DataList('Bitwise operators (&, |, ^, <<, >>)'),
        ]),
        DataList('Control Flow', <DataList>[
          DataList('Conditional statements (if, else if, else)'),
          DataList('Switch statement'),
          DataList('Loops (while, for, do-while)'),
          DataList('Break and continue statements'),
          DataList('Conditional (ternary) operator'),
        ]),
      ]),
      DataList('Functions and Modular Programming', <DataList>[
        DataList('Functions', <DataList>[
          DataList('Function declaration and definition'),
          DataList('Function parameters and return values'),
          DataList('Function prototypes'),
          DataList('Recursive functions'),
          DataList('Function pointers'),
        ]),
        DataList('Scope and Storage Classes', <DataList>[
          DataList('Local and global variables'),
          DataList('Static variables'),
          DataList('Automatic (local) variables'),
          DataList('Register variables'),
        ]),
      ]),
      DataList('Arrays and Pointers', <DataList>[
        DataList('Arrays', <DataList>[
          DataList('Declaring and initializing arrays'),
          DataList('Multidimensional arrays'),
          DataList('Passing arrays to functions'),
          DataList('Array manipulation'),
        ]),
        DataList('Pointers', <DataList>[
          DataList('Introduction to pointers'),
          DataList('Pointer arithmetic'),
          DataList('Pointers and arrays'),
          DataList('Dynamic memory allocation (malloc, free)'),
          DataList('Pointers to functions'),
        ]),
      ]),
      DataList('Structured Data Types', <DataList>[
        DataList('Structures', <DataList>[
          DataList('Defining and using structures'),
          DataList('Nested structures'),
          DataList('Array of structures'),
          DataList('Pointer to structures'),
        ]),
        DataList('Unions', <DataList>[
          DataList('Defining and using unions'),
          DataList('Differences between structures and unions'),
        ]),
      ]),
      DataList('File Handling', <DataList>[
        DataList('File Input/Output'),
        DataList('Opening and closing files'),
        DataList('Reading and writing text files'),
        DataList('Binary file handling'),
      ]),
      DataList('Advanced C Programming', <DataList>[
        DataList('Dynamic Memory Allocation', <DataList>[
          DataList('malloc, calloc, realloc, free'),
          DataList('Memory leaks and memory management'),
        ]),
        DataList('Preprocessor Directives', <DataList>[
          DataList('Macros and #define'),
          DataList('Conditional compilation (#ifdef, #ifndef, #endif)'),
        ]),
        DataList('Advanced Data Types', <DataList>[
          DataList('Enumerations'),
          DataList('Typedef'),
        ]),
        DataList('Bit Manipulation', <DataList>[
          DataList('Bitwise operations for flags and masks'),
        ]),
        DataList('Error Handling', <DataList>[
          DataList('Error codes and errno'),
        ]),
        DataList('Multi-file Programming', <DataList>[
          DataList('Header files and source files'),
          DataList('Makefiles and build systems'),
        ]),
        DataList('Advanced Topics (Optional)', <DataList>[
          DataList('Function pointers and callbacks'),
          DataList('Command-line arguments'),
          DataList('Interfacing with hardware and low-level programming'),
        ]),
        DataList('C Standard Library', <DataList>[
          DataList('Standard I/O functions (printf, scanf, etc.)'),
          DataList('String manipulation functions (strcpy, strlen, etc.)'),
          DataList('Math functions (math.h)'),
          DataList('Time and date functions (time.h)'),
        ]),
      ]),
    ];

    return Scaffold(
      endDrawer: EndDrawer(data: data), // Pass the data list to the EndDrawer
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            // Display the data loaded from sample.json
            _items.isNotEmpty
                ? Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Card(
                    key: ValueKey(_items[index]["id"]),
                    margin: const EdgeInsets.all(10),
                    color: Colors.amber.shade100,
                    child: ListTile(
                      leading: Text(_items[index]["id"]),
                      title: Text(_items[index]["name"]),
                      subtitle: Text(_items[index]["description"]),

                    ),
                  );
                },
              ),
            )
                : Container()
          ],
        ),
      ),
    );
  }
}