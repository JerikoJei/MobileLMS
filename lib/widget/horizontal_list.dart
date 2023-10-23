import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList(
      {super.key, required this.title, required this.subtitle});

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 25),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Colors.deepPurple, Colors.deepPurpleAccent],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 11,
              top: 15,
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    color: Colors.deepPurple),
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Positioned(
              left: 11,
              top: 80,
              right: 11,
              child: Text(
                subtitle,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
