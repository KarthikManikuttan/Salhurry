import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Image.asset(
        'assets/images/vect.png',
        height: 300,
        width: 300,
      ),
    );
  }
}

