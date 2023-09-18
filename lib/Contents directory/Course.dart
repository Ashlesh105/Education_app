import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:education_app1/custom-widget.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaterialApp(
    home: Course(),
    debugShowCheckedModeBanner: false,
  ));
}

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Row(
                children: [
                  TopicWidget(
                    text: "Introduction to C",
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.7,
                    jsonData: {
                      "title": "1. Introduction to C Programming",
                      "explanation":
                          "C is a general-purpose programming language that was developed in the early 1970s at Bell Labs by Dennis Ritchie. It is one of the most widely-used programming languages and serves as a foundation for many other programming languages. C is known for its efficiency, flexibility, and portability.",
                      "codeSnippet":
                          "Here's a simple 'Hello, World!' program in C:\n\n #include <stdio.h>\n\nint main() {\n    printf(\"Hello, World!\\n\");\n    return 0;\n}\n"
                    },
                  ),
                  TopicWidget(
                      text: "Basics of C",
                      jsonData: {
                        "title": "2. Basics of C Programming",
                        "explanation":
                            "To begin programming in C, it's important to understand the basics of the language. This includes the structure of a C program, data types, variables, constants, and basic input/output operations.",
                        "codeSnippet":
                            "Here's an example of declaring variables and printing their values:\n\n```c\n#include <stdio.h>\n\nint main() {\n    int number = 42;\n    float pi = 3.14159;\n    printf(\"Number: %d\\n\", number);\n    printf(\"Pi: %f\\n\", pi);\n    return 0;\n}\n```"
                      },
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.7)
                ],
              ),
              Row(
                children: [
                  TopicWidget(
                      text: "Control flow & decision making in C",
                      jsonData: {
                        "title": "3. Control Flow and Decision Making",
                        "explanation":
                            "Control flow in C involves making decisions and executing specific code blocks based on conditions. C provides various control structures such as if statements, switch statements, loops (while, for, do-while), and more.",
                        "codeSnippet":
                            "Here's an example of an if statement in C:\n\n```c\n#include <stdio.h>\n\nint main() {\n    int num = 10;\n    if (num > 0) {\n        printf(\"Positive\\n\");\n    } else {\n        printf(\"Non-positive\\n\");\n    }\n    return 0;\n}\n```"
                      },
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.7),
                  TopicWidget(
                      text: "Functions & Modular Programming in C",
                      jsonData: {
                        "title": "4. Functions and Modular Programming",
                        "explanation":
                            "Functions are a fundamental concept in C programming, allowing you to break your code into smaller, reusable blocks. Modular programming involves organizing your code into separate functions for better maintainability and readability.",
                        "codeSnippet":
                            "Here's an example of defining and using a function in C:\n\n```c\n#include <stdio.h>\n\nint add(int a, int b) {\n    return a + b;\n}\n\nint main() {\n    int result = add(3, 5);\n    printf(\"Result: %d\\n\", result);\n    return 0;\n}\n```"
                      },
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.7)
                ],
              ),
              Row(
                children: [
                  TopicWidget(
                      text: "Arrays & Pointers in C",
                      jsonData: {
                        "title": "5. Arrays and Pointers",
                        "explanation":
                            "Arrays are used to store collections of data of the same type. Pointers are variables that store memory addresses. Understanding arrays and pointers is crucial for efficient memory management and data manipulation in C.",
                        "codeSnippet":
                            "Here's an example of declaring an array and using a pointer in C:\n\n```c\n#include <stdio.h>\n\nint main() {\n    int numbers[] = {1, 2, 3, 4, 5};\n    int *ptr = numbers;\n    printf(\"Value at index 2: %d\\n\", numbers[2]);\n    printf(\"Value using pointer: %d\\n\", *(ptr + 2));\n    return 0;\n}\n```"
                      },
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.7),
                  TopicWidget(
                      text: " Structures & Unions in C",
                      jsonData: {
                        "title": "6. Structures and Unions",
                        "explanation":
                            "Structures allow you to create custom data types by grouping multiple variables of different data types into a single unit. Unions, on the other hand, share memory space among their members.",
                        "codeSnippet":
                            "Here's an example of defining a structure and a union in C:\n\n```c\nstruct Point {\n    int x;\n    int y;\n};\n\nunion Data {\n    int i;\n    float f;\n    char str[20];\n};\n```"
                      },
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.7)
                ],
              ),
              TopicWidget(
                  text: " File Handling and I/O in C ",
                  jsonData: {
                    "title": "7. File Handling and I/O",
                    "explanation":
                        "C allows you to read from and write to files using file handling functions such as fopen, fclose, fread, and fwrite. You can perform both text and binary file I/O and handle errors gracefully.",
                    "codeSnippet":
                        "Here's an example of opening a text file and writing data in C:\n\n```c\n#include <stdio.h>\n\nint main() {\n    FILE *file = fopen(\"example.txt\", \"w\");\n    fprintf(file, \"Hello, File!\");\n    fclose(file);\n    return 0;\n}\n```"
                  },
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.7)
            ],
          ),
        ),
      ),
    );
  }
}
