import 'package:flutter/material.dart';

class darf extends StatefulWidget {
  const darf({super.key});

  @override
  State<darf> createState() => _darfState();
}

class _darfState extends State<darf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hai Akshay',style: TextStyle(fontSize: 50),),
      ),
    );
  }
}