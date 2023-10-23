import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_app/screen/video_play.dart';
import 'package:lms_app/widget/playlist_widget.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key, required this.titles, required this.imagess});

  final String titles, imagess;
  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    bool fav = false;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(widget.imagess)),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Colors.deepPurpleAccent,
                        Colors.deepPurple
                      ],
                    ),
                  ),
                ),
                title: Text(widget.titles),
              ),
              actions: [
                Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: fav == false
                        ? IconButton(
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.white54,
                            ),
                            onPressed: () {
                              fav = true;
                            },
                          )
                        : IconButton(
                            onPressed: () {
                              fav = false;
                            },
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.pink,
                            ))),
              ]),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 700,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Progress',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const LinearProgressIndicator(
                      value: 0.5,
                      backgroundColor: Colors.black12,
                      color: Colors.deepPurple,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const VideoPlayer()));
                            },
                            child: const PlayListWidget(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
