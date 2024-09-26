import 'package:flutter/material.dart';

class loninpage extends StatefulWidget {
  final String mail;
  final String passord;
  const loninpage({super.key, required this.mail, required this. passord});

  @override
  State<loninpage> createState() => _loninpageState();
}

class _loninpageState extends State<loninpage> {
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
              "Email: ${widget.mail}\nPassword : ${widget.passord}",
              style: TextStyle(color: Colors.white,fontSize: 25,fontWeight:FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
