import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> messages = [];
  bool isActive = false;
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: messageController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Enter your message",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (messageController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Please enter message");
                      } else {
                        messages.add(messageController.text);
                        log(messages.toString());
                        setState(() {
                          isActive = true;
                        });
                        messageController.clear();
                      }
                    },
                    child: const Text("Send"),
                  ),
                )
              ],
            ),
            isActive
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: (ListView.builder(
                      itemCount: messages.length,
                      prototypeItem: Text(messages.first),
                      itemBuilder: (context, index) {
                        var msg = messages[index];
                        log(messages.length.toString());
                        log(messages.toString());
                        return ListTile(
                          title: Text(
                            msg,
                          ),
                          subtitle: const Text(""),
                        );
                      },
                    )),
                  )
                : const Text("no messages")
          ],
        ),
      ),
    );
  }
}
