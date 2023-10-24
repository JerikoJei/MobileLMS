import 'package:flutter/material.dart';
import 'package:lms_app/widget/playlist_widget.dart';
import 'package:lms_app/widget/video_player_widget.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({super.key});
  final videoUrl = 'https://www.youtube.com/watch?v=YMx8Bbev6T4';

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
      body: Column(
        children: [
          VideoPlayerWidget(
            videoUrl: videoUrl,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const VideoPlayer()));
                  },
                  child: const PlayListWidget(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
