import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;

  const LoginPage({super.key, required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // textfield controllers
  final _emailControllers = TextEditingController();
  final _passwordControllers = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailControllers.text.trim(),
        password: _passwordControllers.text.trim());
  }

  @override
  void dispose() {
    _emailControllers.dispose();
    _passwordControllers.dispose();
    super.dispose();
  }

  // password hide logic
  bool _obscureText = true;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Banner
                  Container(
                    width: double.infinity,
                    child: Text(
                      'Hai,\nSelamat datang!',
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
                      'Ayo jelajahi aplikasi kami, kami menyediakan banyak layanan disini',
                      style: GoogleFonts.josefinSans(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),

                  // Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.gamepad,
                        color: Colors.black87,
                        size: 128,
                      ),
                      SizedBox(width: 24),
                      Icon(
                        Icons.gamepad_outlined,
                        color: Colors.black87,
                        size: 128,
                      ),
                      SizedBox(width: 24),
                    ],
                  ),
                  SizedBox(height: 24),

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

                  // Login
                  GestureDetector(
                    onTap: signIn,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.green,
                      ),
                      child: Center(
                        child: Text(
                          'Login',
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
                        'Belum punya akun?',
                        style: GoogleFonts.josefinSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.showRegisterPage,
                        child: Text(
                          'Daftar sekarang!',
                          style: GoogleFonts.josefinSans(
                              color: Colors.green,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  )

                  // Container(
                  //   width: double.infinity,
                  //   padding: EdgeInsets.symmetric(vertical: 20),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(16),
                  //     border: Border.all(color: Colors.green, width: 2),
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       'Register',
                  //       style: GoogleFonts.josefinSans(
                  //           color: Colors.green,
                  //           fontWeight: FontWeight.w700,
                  //           fontSize: 16),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
