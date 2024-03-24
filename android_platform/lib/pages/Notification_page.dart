import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workwell/components/button.dart';
import 'package:workwell/services/auth%20_service.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {

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
            Text("Notifications",
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
