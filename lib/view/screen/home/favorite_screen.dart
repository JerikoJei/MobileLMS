import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_app/provider/course_provider.dart';
import 'package:lms_app/view/screen/fav_course_screen.dart';
import 'package:lms_app/view/widget/vertical_list.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late CourseProvider courseProvider1;

  @override
  void initState() {
    courseProvider1 = Provider.of<CourseProvider>(context, listen: false);
    courseProvider1.getFavlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Favorite',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.deepPurpleAccent, Colors.deepPurple],
            ),
          ),
        ),
      ),
      body: ListView(children: [
        const SizedBox(
          height: 20,
        ),
        Consumer<CourseProvider>(builder: (context, courseProvider, _) {
          return courseProvider1.favCourseList.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: courseProvider.favCourseList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FavCourseScreen(
                                    index: index,
                                  )));
                        },
                        child: VerticalList(
                          course: courseProvider.favCourseList[index],
                        ));
                  },
                )
              : Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'Your Favorite List is Still Empty',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ));
        })
      ]),
    );
  }
}
