import 'dart:io';

import 'package:flutter/material.dart';
import 'package:threepage/darft.dart';
import 'package:threepage/demo.dart';
import 'package:threepage/login.dart';
import 'package:threepage/search.dart';
import 'package:threepage/send.dart';
import 'package:threepage/signin.dart';

class botto extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String password;
  final File imageFile;
  const botto(
      {super.key,
      required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.imageFile});

  @override
  State<botto> createState() => _bottoState();
}

class _bottoState extends State<botto> {
  int _selectedindex = 0;

  List<Widget> get _pages => [
        Homepage(),
        Searchpage(),
        signinpage(
          name: widget.name,
          email: widget.email,
          password: widget.password,
          phone: widget.phone,
          imageFile: widget.imageFile,
        )
      ];
  void _onItem(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Navigator',
          style: TextStyle(color: const Color.fromARGB(255, 6, 9, 36)),
        ),
      ),
      body: Center(
        child: _pages[_selectedindex],
      ),
      drawer: Drawer(
        child: ListView(children: <Widget>[
          ListTile(
            title: Text('Primary'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => second()));
            },
          ),
          ListTile(
            title: Text('Draft'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => darf()));
            },
          ),
          ListTile(
            title: Text('Send'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: 
                (BuildContext context)=>send()
                )
              );
            },
          )
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
        currentIndex: _selectedindex,
        selectedItemColor: const Color.fromARGB(255, 64, 3, 76),
        onTap: _onItem,
      ),
    );
  }
}
