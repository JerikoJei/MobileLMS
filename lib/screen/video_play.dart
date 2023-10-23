import 'package:flutter/material.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.deepPurpleAccent, Colors.deepPurple],
            ),
          ),
        ),
        title: const Text('Hello'),
      ),
      body: const Text('Hello 2'),
    );
  }
}
