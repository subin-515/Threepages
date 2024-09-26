import 'dart:io';

import 'package:flutter/material.dart';

class signinpage extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String password;
  final File imageFile;
  const signinpage(
      {super.key,
      required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.imageFile});

  @override
  State<signinpage> createState() => _signinpageState();
}

class _signinpageState extends State<signinpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30.0),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color.fromARGB(255, 2, 8, 52),
                const Color.fromARGB(255, 115, 120, 137)
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Name : ${widget.name}\nEmail : ${widget.email}\nPhone No : ${widget.phone}\nPassword : ${widget.password}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
            Image.file(widget.imageFile)
          ],
        ),
      ),
    );
  }
}
