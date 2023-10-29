import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_app/model/course_model.dart';
import 'package:lms_app/model/video_model.dart';
import 'package:lms_app/provider/course_provider.dart';
import 'package:lms_app/widget/playlist_widget.dart';
import 'package:lms_app/widget/video_player_widget.dart';
import 'package:provider/provider.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({
    super.key,
    required this.videourl,
    required this.datavid,
    required this.namavid,
    required this.courseid,
  });
  final String videourl, namavid;
  final List<VideoModel> datavid;
  final CourseModel courseid;
  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
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
        title: Text(widget.namavid),
      ),
      body: Consumer<CourseProvider>(
        builder: (context, courseProvider, _) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayerWidget(
              videoUrl: widget.videourl,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                widget.namavid,
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Consumer<CourseProvider>(
                builder: (context, courseProvider, _) => Text(
                  'Status : ${courseProvider.status}',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Consumer<CourseProvider>(
                  builder: (context, courseProvider, _) => Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                courseProvider.isnotwatched(widget.courseid);
                              },
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.deepPurple),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                              ),
                              child: const Text('Notwatched'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                courseProvider.iswatched(widget.courseid);
                              },
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.deepPurple),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                              ),
                              child: const Text('Watched'),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: widget.datavid.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                  onTap: () {
                                    courseProvider.currentPlayed = index;
                                    courseProvider.checkWatch(widget.courseid);
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => VideoPlayer(
                                          courseid: widget.courseid,
                                          videourl: widget.datavid[index].vid,
                                          datavid: widget.datavid,
                                          namavid:
                                              widget.datavid[index].namavid,
                                        ),
                                      ),
                                    );
                                  },
                                  child: PlayListWidget(
                                    vid: widget.datavid[index],
                                  ));
                            },
                          ),
                        ),
                      ])),
            ),
          ],
        ),
      ),
    );
  }
}
