import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workwell/components/button.dart';
import 'package:workwell/services/auth%20_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

    void logout(){
    final authService = AuthService();
    authService.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            Text("Settings",
                style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary)),
            MyButton(text: 'logout', onTap: logout, height: 50),
          ]),
        ),
      ),
    );
  }
}
