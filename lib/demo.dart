import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hai'),
      ),
      body: Center(
        child: ElevatedButton(child: Text('Show'), onPressed: show),
      ),
    );
  }

  void show() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 400,
            child: Center(
              child: Text(
                'This is ths model of bottom',
                style: TextStyle(
                    color: const Color.fromARGB(
                      255,
                      23,
                      0,
                      29,
                    ),
                    fontSize: 20),
              ),
            ),
          );
        });
  }
}
