import 'package:flutter/material.dart';
import 'package:threepage/loginin.dart';
import 'package:threepage/signup.dart';
import 'package:url_launcher/url_launcher.dart';

class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool ubin = true;

  void pass() {
    setState(() {
      ubin = !ubin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color.fromARGB(255, 2, 8, 52),
                  const Color.fromARGB(255, 115, 120, 137)
                ]),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/log1.png',
                  height: 300,
                ),
                Text(
                  'Welcome Back,',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'Make it work, make it right,make it fast.',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    label: Text(
                      "Email",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 254, 254)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 255, 255, 255))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 255, 255, 255))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 227, 5, 5),
                          width: 4,
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: ubin,
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_outline_outlined,
                      color: const Color.fromARGB(255, 245, 243, 243),
                    ),
                    label: Text(
                      'password',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 255, 251, 251)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(255, 255, 252, 252))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 255, 254, 254),
                          width: 2,
                        )),
                    suffixIcon: IconButton(
                        onPressed: pass,
                        icon: Icon(
                          ubin ? Icons.visibility_off : Icons.visibility,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Three())),
                      child: Text(
                        "Forget password",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 246, 246, 255)),
                      )),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Procssing Data'),
                          ),
                        );

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => loninpage(
                                  mail: _emailcontroller.text,
                                  passord: _passwordcontroller.text,
                                )));
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      foregroundColor: const Color.fromARGB(255, 51, 26, 78),
                      backgroundColor: const Color.fromARGB(255, 255, 252, 252),
                      side: BorderSide(
                          color: const Color.fromARGB(255, 254, 255, 255)),
                    ),
                    child: Text('LOGIN'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(172, 30, 13, 30),
                  child: Text(
                    'OR',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
               SizedBox(
  height: 55,
  width: double.infinity,
  child: GestureDetector(
    onTap: () async {
               await launch ('https://www.google.com');
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 255, 255, 255),
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/google.png',
            width: 24.0,
            height: 24.0,
          ),
         SizedBox(width: 8),
          Text(
            "Sign in with Google",
            style: TextStyle(
              color: Color.fromARGB(255, 51, 26, 78),
            ),
          ),
        ],
      ),
    ),
  ),
),
                Padding(
                    padding: EdgeInsets.fromLTRB(75, 10, 18, 0),
                    child: Row(
                      children: [
                        Text(
                          "Don't have an Account?",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16),
                        ),
                        TextButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Three())),
                            child: Text(
                              "Signup",
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 249, 249, 249),
                                  fontSize: 16),
                            )),
                      ],
                    )),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
