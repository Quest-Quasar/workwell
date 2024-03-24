import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workwell/components/button.dart';
import 'package:workwell/components/linear_line.dart';
import 'package:workwell/components/textfield.dart';
import 'package:workwell/pages/login_page.dart';
import 'package:workwell/services/auth%20_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, this.onTap});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ConfirmpasswordController =
      TextEditingController();

  bool _isError = false;
  String Error = '';

  void register() async {
    final authService = AuthService();

    // Passwords match
    if (passwordController.text == ConfirmpasswordController.text) {
      try {
        setState(() {
          _isError = false;
        });
        await authService.signUpWithEmailPassword(
            emailController.text, passwordController.text);
        authService.signOut();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginPage()));
      } catch (e) {
        setState(() {
          _isError = true;
          Error = _mapFirebaseAuthErrorCode(_extractErrorMessage(e.toString()));
        });
      }
    }
    // Passwords don't match
    else {
      setState(() {
        _isError = true;
        Error = "Confirm Password doesn't match";
      });
    }
  }

  String _extractErrorMessage(String errorString) {
    List<String> parts = errorString.split(':');
    return parts.length > 1 ? parts[1].trim() : errorString;
  }

  String _mapFirebaseAuthErrorCode(String code) {
    switch (code) {
      case 'weak-password':
        return 'Password too weak:\n'
            '- Password must be at least 6 characters long\n';
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      case 'invalid-email':
        return 'Invalid email format.';
      default:
        return 'An error occurred. Please try again later.';
    }
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
              Text("Register",
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary)),
              const SizedBox(height: 18),
              Text("Create your new account",
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.inversePrimary)),

              //email textfield
              const SizedBox(height: 14),
              SizedBox(
                height: 50,
                child: InputTextfield(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false),
              ),

              //username textfield
              const SizedBox(height: 18),
              SizedBox(
                height: 50,
                child: InputTextfield(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true),
              ),

              //password textfield
              const SizedBox(height: 18),
              SizedBox(
                height: 50,
                child: InputTextfield(
                    controller: ConfirmpasswordController,
                    hintText: 'Confirm Password',
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

              const SizedBox(height: 20),
              //sign up button
              MyButton(text: 'Sign Up', onTap: register, height: 50),

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
                    "Already have an Account ? ",
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
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const LoginPage(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(-1.0, 0.0),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Log In',
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
