import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayListWidget extends StatefulWidget {
  const PlayListWidget({super.key});

  @override
  State<PlayListWidget> createState() => _PlayListWidgetState();
}

class _PlayListWidgetState extends State<PlayListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const Icon(
            Icons.play_arrow,
            size: 45,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello',
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, fontSize: 15),
              )
            ],
          )),
        ],
      ),
    );
  }
}
