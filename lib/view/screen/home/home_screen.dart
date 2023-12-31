import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_app/Utils/image.dart';
import 'package:lms_app/provider/course_provider.dart';
import 'package:lms_app/view/screen/course_screen.dart';
import 'package:lms_app/view/screen/search_course.dart';

import 'package:lms_app/view/widget/horizontal_list.dart';
import 'package:lms_app/view/widget/vertical_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CourseProvider courseProvider;

  @override
  void initState() {
    courseProvider = Provider.of<CourseProvider>(context, listen: false);
    courseProvider.getCourseList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        //flexiblespace agar bisa memberikan gradient color
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.deepPurpleAccent, Colors.deepPurple],
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const SearchCourse())),
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView(
        children: [
          //imageslishow untuk berganti foto di halaman
          ImageSlideshow(
            //autoplayinterval = 6 seconds
            autoPlayInterval: 6000,
            isLoop: true,
            width: double.infinity,
            height: 200,
            //page yang dimunculkan pertama kali
            initialPage: 0,
            //warna untuk bullet
            indicatorColor: Colors.deepPurple,
            indicatorBackgroundColor: Colors.grey,
            //membuat images menjadi map terlebih dahulu, lalu nantinya setiap autoplayinterval imagepath akan berubah,setelah itu lalu diubah kembali menjadi list
            children: images.map((imagePath) {
              return Image.asset(
                imagePath,
                fit: BoxFit.cover,
              );
            }).toList(),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Popular e-learning',
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 250,
            child:
                Consumer<CourseProvider>(builder: (context, courseProvider, _) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: courseProvider.courselist.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: HorizontalList(
                      title: courseProvider.courselist[index].name,
                      image: courseProvider.courselist[index].image,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CourseScreen(
                            index: index,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Explore e-Learning',
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Consumer<CourseProvider>(builder: (context, courseProvider, _) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: courseProvider.courselist.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CourseScreen(
                                index: index,
                              )));
                    },
                    child: VerticalList(
                      course: courseProvider.courselist[index],
                    ));
              },
            );
          })
        ],
      ),
    );
  }
}
