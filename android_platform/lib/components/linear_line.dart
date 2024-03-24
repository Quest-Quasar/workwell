import 'package:flutter/material.dart';

class LinearLine extends StatefulWidget {
  final Color color1;
  final Color color2;
  const LinearLine({super.key, required this.color1, required this.color2});

  @override
  State<LinearLine> createState() => _LinearLineState();
}

class _LinearLineState extends State<LinearLine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            widget.color1,
            widget.color2,
          ],
        ),
      ),
      child: const Divider(
        color: Colors.transparent,
        height: 1,
      ),
    );
  }
}