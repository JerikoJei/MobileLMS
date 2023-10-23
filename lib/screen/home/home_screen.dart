import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_app/Utils/image.dart';
import 'package:lms_app/screen/course_screen.dart';
import 'package:lms_app/widget/horizontal_list.dart';
import 'package:lms_app/widget/vertical_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> titless = <String>[
    'helloo',
    'test1',
    'test2',
    'test3',
  ];
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: titless.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: HorizontalList(
                    title: titless[index],
                    subtitle: 'this is just for testing, good luck for me hehe',
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CourseScreen(
                              titles: titless[index],
                              imagess: images[index],
                            )));
                  },
                );
              },
            ),
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
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CourseScreen(
                              imagess: images[index],
                              titles: titless[index],
                            )));
                  },
                  child: VerticalList(
                      images: images[index], titles: titless[index]));
            },
          )
        ],
      ),
    );
  }
}
