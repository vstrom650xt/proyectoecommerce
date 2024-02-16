import 'package:flutter/material.dart';

class BotonEstilo extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String text;
  final VoidCallback onPressed;
  const BotonEstilo({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final LinearGradient buttonGradient = const LinearGradient(
    colors: [Colors.blueAccent, Color.fromARGB(255, 94, 32, 209)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: buttonGradient,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          fixedSize: Size(screenWidth * 0.4, screenHeight * 0.06),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: screenHeight * 0.02,
          ),
        ),
      ),
    );
  }
}
