import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workwell/components/button.dart';
import 'package:workwell/components/check_row.dart';
import 'package:workwell/components/linear_line.dart';
import 'package:workwell/components/textfield.dart';
import 'package:workwell/pages/register_page.dart';
import 'package:workwell/services/auth%20_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, this.onTap});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isError = false;
  String Error = '';

  void login() async {
    final _authService = AuthService();
    try {
      setState(() {
        _isError = false;
      });
      await _authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      setState(() {
        _isError = true;
        print("e.toString() == ${e.toString()}");
        if (_extractErrorMessage(e.toString()) == 'invalid-credential') {
          setState(() {
            Error = 'Invalid: Email or Password is not corrected.';
          });
        } else {
          Error = "An unexpected error occurred. Please try again later.";
        }
      });
    }
  }

  String _extractErrorMessage(String errorString) {
    List<String> parts = errorString.split(':');
    return parts.length > 1 ? parts[1].trim() : errorString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Hero(
                tag: 'logoTag', // Unique tag for the Hero animation
                child: Image.asset(
                  'assets/images/Logo.png',
                  width: 300,
                  height: 160,
                ),
              ),
              const SizedBox(height: 22),
              //Welcome back message
              Text("Welcome",
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary)),
              const SizedBox(height: 18),
              Text("Login to your account",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.inversePrimary)),

              //username textfield
              const SizedBox(height: 14),
              SizedBox(
                height: 50,
                child: InputTextfield(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false),
              ),

              //password textfield
              const SizedBox(height: 18),
              SizedBox(
                height: 50,
                child: InputTextfield(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true),
              ),
              const SizedBox(height: 10),

              //Error message
              if (_isError)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        Error,
                        style: GoogleFonts.poppins(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),

              //remember me checkbox
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MyCheckbox(text: 'Remember Me'),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Forgot Password ?',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),
              //sign in button
              MyButton(text: 'Sign In', onTap: login, height: 50),

              //-OR-
              const SizedBox(height: 15),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: LinearLine(
                              color1: Theme.of(context).colorScheme.background,
                              color2: Theme.of(context).colorScheme.primary)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'OR',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context)
                                .colorScheme
                                .inversePrimary, // Text color
                          ),
                        ),
                      ),
                      Expanded(
                          child: LinearLine(
                              color1: Theme.of(context).colorScheme.primary,
                              color2:
                                  Theme.of(context).colorScheme.background)),
                    ],
                  )),

              //dont have an account?
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an Account ? ",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) {
                          return const RegisterPage();
                        }),
                      );
                    },
                    child: Text(
                      'Create Acoount',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
