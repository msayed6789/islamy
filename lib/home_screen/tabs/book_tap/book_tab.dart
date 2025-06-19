import 'package:flutter/material.dart';

class BookTab extends StatelessWidget {
  const BookTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Center(child: Text("Book Tab",style: TextStyle(color: Colors.white),))
        ],
      ),
    );
  }
}