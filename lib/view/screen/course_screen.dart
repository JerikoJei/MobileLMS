import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_app/provider/course_provider.dart';
import 'package:lms_app/view/screen/video_play.dart';
import 'package:lms_app/view/widget/playlist_widget.dart';
import 'package:provider/provider.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key, required this.index});
  final int index;
  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  late CourseProvider courseProvider1;
  @override
  void initState() {
    courseProvider1 = Provider.of<CourseProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        image: NetworkImage(
                            courseProvider1.courselist[widget.index].image)),
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
                title: Text(courseProvider1.courselist[widget.index].name),
              ),
              actions: [
                Consumer<CourseProvider>(
                  builder: (context, courseProvider, _) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: courseProvider.isFavg == false
                          ? IconButton(
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.white54,
                              ),
                              onPressed: () {
                                courseProvider.isFav(
                                    courseProvider.courselist[widget.index]);
                              },
                            )
                          : IconButton(
                              onPressed: () {
                                courseProvider.isNotFav(
                                    courseProvider.courselist[widget.index]);
                              },
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.pink,
                              ))),
                ),
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
                    Consumer<CourseProvider>(
                      builder: (context, courseProvider, _) =>
                          LinearProgressIndicator(
                        value: courseProvider.watchProgress(
                            courseProvider.courselist[widget.index]),
                        backgroundColor: Colors.black12,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Expanded(
                      child: Consumer<CourseProvider>(
                        builder: (context, courseProvider, _) =>
                            ListView.builder(
                          itemCount: courseProvider
                              .courselist[widget.index].listvid.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                courseProvider.currentPlayed = index;
                                courseProvider.checkWatch(
                                    courseProvider.courselist[widget.index]);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => VideoPlayer(
                                          courseid: courseProvider
                                              .courselist[widget.index],
                                          videourl: courseProvider
                                              .courselist[widget.index]
                                              .listvid[index]
                                              .vid,
                                          datavid: courseProvider
                                              .courselist[widget.index].listvid,
                                          namavid: courseProvider
                                              .courselist[widget.index]
                                              .listvid[index]
                                              .namavid,
                                        )));
                              },
                              child: PlayListWidget(
                                vid: courseProvider
                                    .courselist[widget.index].listvid[index],
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
