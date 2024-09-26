import 'package:flutter/material.dart';
import 'package:threepage/login.dart';
import 'package:threepage/signup.dart';

class Frist extends StatefulWidget {
  const Frist({super.key});

  @override
  State<Frist> createState() => _FristState();
}

class _FristState extends State<Frist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30.0),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/log1.png'),
            Column(
              children: [
                Text(
                  'Bulit Awesome Apps',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 248, 248, 248),
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  "Let's Put your creativity on the ",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'development highway',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => second())),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        foregroundColor:
                            const Color.fromARGB(255, 252, 254, 255),
                        side: BorderSide(
                            color: const Color.fromARGB(255, 164, 166, 167)),
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text('LOGIN')),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: ()  => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Three())),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        foregroundColor:
                            const Color.fromARGB(255, 247, 247, 247),
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        side: BorderSide(
                            color: const Color.fromARGB(255, 1, 36, 49)),
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text('SIGNUP')),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
