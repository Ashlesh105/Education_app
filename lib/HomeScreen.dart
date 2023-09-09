import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'Contents.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);

  runApp(const MaterialApp(
    home: LetsGoPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class LetsGoPage extends StatefulWidget {
  const LetsGoPage({super.key});

  @override
  State<LetsGoPage> createState() => _LetsGoPageState();
}

class _LetsGoPageState extends State<LetsGoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient:
            LinearGradient(colors: [Colors.blueAccent, Colors.purple])),
        child: ListView(
          children: [
            ChatBubble(
              clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
              backGroundColor: const Color(0xffE7E7ED),
              shadowColor: Colors.black87,
              elevation: 10.0,
              margin: const EdgeInsets.only(top: 20),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: const Text(
                  "Hi Welcome!!",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            ),
            ChatBubble(
              clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
              alignment: Alignment.topRight,
              margin: const EdgeInsets.only(top: 20),
              backGroundColor: Colors.blue,
              shadowColor: Colors.black87,
              elevation: 10.0,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: const Text(
                  "Be raedy to gain some great knowledge about C programming",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            ChatBubble(
              clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
              backGroundColor: const Color(0xffE7E7ED),
              shadowColor: Colors.black87,
              elevation: 10.0,
              margin: const EdgeInsets.only(top: 20),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: const Text(
                  "Let's get going",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ContentsPage()));
        },
        child: const Text(
          "Let's Go",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
