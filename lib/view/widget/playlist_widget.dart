import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_app/model/video_model.dart';
import 'package:lms_app/provider/course_provider.dart';
import 'package:provider/provider.dart';

class PlayListWidget extends StatefulWidget {
  const PlayListWidget({super.key, required this.vid});
  final VideoModel vid;

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
          Expanded(child: Consumer<CourseProvider>(
            builder: (context, courseProvider, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.vid.namavid,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500, fontSize: 15),
                  )
                ],
              );
            },
          )),
        ],
      ),
    );
  }
}
