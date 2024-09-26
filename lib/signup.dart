import 'dart:io';
import 'package:flutter/material.dart';
import 'package:threepage/bottom.dart';
import 'package:threepage/login.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';

class Three extends StatefulWidget {
  const Three({super.key});

  @override
  State<Three> createState() => _ThreeState();
}

class _ThreeState extends State<Three> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  final _formKey = GlobalKey<FormState>();

  void _pickImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 2, 8, 52),
                Color.fromARGB(255, 115, 120, 137),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/log1.png',
                  height: 260,
                ),
                const Text(
                  'Get On Board!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Text(
                  'Create your profile to start your Journey.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor:
                            Colors.grey[300], 
                        child: _imageFile != null
                            ? ClipOval(
                                child: Image.file(
                                  _imageFile!,
                                  fit: BoxFit.cover,
                                  width: 80,
                                  height: 80,
                                ),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.camera_alt, 
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Pick image',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  controller: _nameController,
                  labelText: 'Full Name',
                  icon: Icons.person,
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  controller: _mailController,
                  labelText: 'Email',
                  icon: Icons.email,
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  controller: _phoneController,
                  labelText: 'Phone No',
                  icon: Icons.numbers,
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  icon: Icons.lock,
                  isObscure: true,
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_imageFile != null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => botto(
                                imageFile: _imageFile!,
                                name: _nameController.text,
                                email: _mailController.text,
                                phone: _phoneController.text,
                                password: _passwordController.text,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please pick an image first'),
                            ),
                          );
                        }
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      foregroundColor: const Color.fromARGB(255, 51, 26, 78),
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                    ),
                    child: const Text('SIGNUP'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(172, 30, 13, 30),
                  child: Text(
                    'OR',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                _buildGoogleSignInButton(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(75, 10, 18, 0),
                  child: Row(
                    children: [
                      const Text(
                        "Already have an Account?",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const second(),
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    bool isObscure = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $labelText';
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 4),
        ),
      ),
    );
  }

  Widget _buildGoogleSignInButton() {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: GestureDetector(
        onTap: () async {
          await launch('https://mail.google.com');
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/google.png',
                width: 24.0,
                height: 24.0,
              ),
              const SizedBox(width: 8),
              const Text(
                "Sign in with Google",
                style: TextStyle(color: Color.fromARGB(255, 51, 26, 78)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
