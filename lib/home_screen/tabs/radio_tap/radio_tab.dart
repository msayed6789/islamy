import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: Stack(
        children: [
          Center(child: Text("Radio Tab",style: TextStyle(color: Colors.white),))
        ],
      ),
    );
  }
}