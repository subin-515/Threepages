import 'package:flutter/material.dart';

class send extends StatefulWidget {
  const send({super.key});

  @override
  State<send> createState() => _sendState();
}

class _sendState extends State<send> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 33, 1, 39),
        child: Text('You Look Smart',style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),),
      )
    );
  }
}