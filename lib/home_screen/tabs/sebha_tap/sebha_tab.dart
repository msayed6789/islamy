import 'package:flutter/material.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: Stack(
        children: [
          Center(child: Text("Sebha Tab",style: TextStyle(color: Colors.white),))
        ],
      ),
    );
  }
}