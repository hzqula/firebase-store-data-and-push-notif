import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailControllers = TextEditingController();
  final _passwordControllers = TextEditingController();
  final _confirmPasswordControllers = TextEditingController();
  final _firstNameControllers = TextEditingController();
  final _lastNameControllers = TextEditingController();

  @override
  void dispose() {
    _emailControllers.dispose();
    _passwordControllers.dispose();
    _confirmPasswordControllers.dispose();
    _firstNameControllers.dispose();
    _lastNameControllers.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      // Create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailControllers.text.trim(),
        password: _passwordControllers.text.trim(),
      );

      // Add user details
      addUserDetails(_firstNameControllers.text.trim(),
          _lastNameControllers.text.trim(), _emailControllers.text.trim());
    }
  }

  Future addUserDetails(String firstName, String lastName, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
    });
  }

  bool passwordConfirmed() {
    if (_passwordControllers.text.trim() ==
        _confirmPasswordControllers.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  bool _obscureText = true;
  bool _obscureTextConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Banner
                  Container(
                    width: double.infinity,
                    child: Text(
                      'Ayo segera daftarkan akun!',
                      style: GoogleFonts.josefinSans(
                        color: Colors.black87,
                        fontWeight: FontWeight.w900,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      'Lengkapi form di bawah ini, dan jelajahi aplikasi kami',
                      style: GoogleFonts.josefinSans(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),

                  // First Name
                  TextField(
                    controller: _firstNameControllers,
                    style: GoogleFonts.josefinSans(),
                    cursorColor: Colors.green[900],
                    cursorWidth: 2,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      labelStyle: GoogleFonts.jost(
                          color: Colors.green[900],
                          fontWeight: FontWeight.w600),
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: Colors.green,
                      hintText: 'John',
                      hintStyle: GoogleFonts.jost(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87),
                          borderRadius: BorderRadius.circular(16)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87),
                          borderRadius: BorderRadius.circular(16)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Email
                  TextField(
                    controller: _lastNameControllers,
                    style: GoogleFonts.josefinSans(),
                    cursorColor: Colors.green[900],
                    cursorWidth: 2,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      labelStyle: GoogleFonts.jost(
                          color: Colors.green[900],
                          fontWeight: FontWeight.w600),
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: Colors.green,
                      hintText: 'Doe',
                      hintStyle: GoogleFonts.jost(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87),
                          borderRadius: BorderRadius.circular(16)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87),
                          borderRadius: BorderRadius.circular(16)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Email
                  TextField(
                    controller: _emailControllers,
                    style: GoogleFonts.josefinSans(),
                    cursorColor: Colors.green[900],
                    cursorWidth: 2,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: GoogleFonts.jost(
                          color: Colors.green[900],
                          fontWeight: FontWeight.w600),
                      prefixIcon: Icon(Icons.email_outlined),
                      prefixIconColor: Colors.green,
                      hintText: 'email@gmail.com',
                      hintStyle: GoogleFonts.jost(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87),
                          borderRadius: BorderRadius.circular(16)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87),
                          borderRadius: BorderRadius.circular(16)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Password
                  TextField(
                    controller: _passwordControllers,
                    style: GoogleFonts.josefinSans(),
                    obscureText: _obscureText,
                    cursorColor: Colors.green[900],
                    cursorWidth: 2,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: GoogleFonts.jost(
                          color: Colors.green[900],
                          fontWeight: FontWeight.w600),
                      prefixIcon: Icon(Icons.password_outlined),
                      prefixIconColor: Colors.green,
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.remove_red_eye
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      suffixIconColor: Colors.green,
                      hintText: '******',
                      hintStyle: GoogleFonts.jost(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87),
                          borderRadius: BorderRadius.circular(16)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87),
                          borderRadius: BorderRadius.circular(16)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Confirm Password
                  TextField(
                    controller: _confirmPasswordControllers,
                    style: GoogleFonts.josefinSans(),
                    obscureText: _obscureTextConfirm,
                    cursorColor: Colors.green[900],
                    cursorWidth: 2,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: GoogleFonts.jost(
                          color: Colors.green[900],
                          fontWeight: FontWeight.w600),
                      prefixIcon: Icon(Icons.confirmation_number_outlined),
                      prefixIconColor: Colors.green,
                      suffixIcon: IconButton(
                        icon: Icon(_obscureTextConfirm
                            ? Icons.remove_red_eye
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _obscureTextConfirm = !_obscureTextConfirm;
                          });
                        },
                      ),
                      suffixIconColor: Colors.green,
                      hintText: '******',
                      hintStyle: GoogleFonts.jost(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87),
                          borderRadius: BorderRadius.circular(16)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87),
                          borderRadius: BorderRadius.circular(16)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Register
                  GestureDetector(
                    onTap: signUp,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.green,
                      ),
                      child: Center(
                        child: Text(
                          'Daftar',
                          style: GoogleFonts.josefinSans(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah punya akun?',
                        style: GoogleFonts.josefinSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.showLoginPage,
                        child: Text(
                          'Login disini!',
                          style: GoogleFonts.josefinSans(
                              color: Colors.green,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
