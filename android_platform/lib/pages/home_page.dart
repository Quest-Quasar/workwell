import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Text("Home",
                style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary)),
          ]),
        ),
      ),
    );
  }
}
