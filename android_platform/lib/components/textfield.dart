import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const InputTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  _InputTextfieldState createState() {
    return _InputTextfieldState();
  }
}

class _InputTextfieldState extends State<InputTextfield> {
  bool eyeopen = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText && !eyeopen,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.tertiary),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.onPrimary),
            borderRadius: BorderRadius.circular(8.0),
          ),
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color:
                Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
          ),
          suffixIcon: widget.hintText.toLowerCase() == 'password' || widget.hintText.toLowerCase() == 'confirm password' 
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      eyeopen = !eyeopen;
                    });
                  },
                  icon: eyeopen
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                  color: Theme.of(context).colorScheme.inversePrimary,
                )
              : null,
        ),
      ),
    );
  }
}
