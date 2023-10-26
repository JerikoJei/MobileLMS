import 'package:flutter/material.dart';
import 'package:lms_app/model/video_model.dart';
import 'package:lms_app/provider/course_provider.dart';
import 'package:lms_app/widget/playlist_widget.dart';
import 'package:lms_app/widget/video_player_widget.dart';
import 'package:provider/provider.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key, required this.videourl, required this.datavid});
  final String videourl;
  final List<VideoModel> datavid;
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
        title: const Text('Hello'),
      ),
      body: Consumer<CourseProvider>(
        builder: (context, courseProvider, _) => Column(
          children: [
            VideoPlayerWidget(
              videoUrl: widget.videourl,
            ),
            Expanded(
              child: Consumer<CourseProvider>(
                builder: (context, courseProvider, child) => ListView.builder(
                  itemCount: widget.datavid.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => VideoPlayer(
                                  videourl: widget.datavid[index].vid,
                                  datavid: widget.datavid,
                                )));
                      },
                      child: PlayListWidget(
                        vid: widget.datavid[index],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
