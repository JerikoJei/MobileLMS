import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_app/model/course_model.dart';
import 'package:lms_app/provider/course_provider.dart';
import 'package:lms_app/screen/video_play.dart';
import 'package:lms_app/widget/playlist_widget.dart';
import 'package:provider/provider.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key, required this.course});

  final CourseModel course;
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
                    image: DecorationImage(
                        image: NetworkImage(widget.course.image)),
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
                title: Text(widget.course.name),
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
                      child: Consumer<CourseProvider>(
                        builder: (context, courseProvider, _) =>
                            ListView.builder(
                          itemCount: widget.course.listvid.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => VideoPlayer(
                                          videourl:
                                              widget.course.listvid[index].vid,
                                          datavid: widget.course.listvid,
                                        )));
                              },
                              child: PlayListWidget(
                                vid: widget.course.listvid[index],
                              ),
                            );
                          },
                        ),
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
