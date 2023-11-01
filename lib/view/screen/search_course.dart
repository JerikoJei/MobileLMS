import 'package:flutter/material.dart';
import 'package:lms_app/provider/course_provider.dart';
import 'package:lms_app/provider/search_course_provider.dart';
import 'package:lms_app/view/screen/course_screen.dart';
import 'package:lms_app/view/widget/vertical_list.dart';
import 'package:provider/provider.dart';

class SearchCourse extends StatefulWidget {
  const SearchCourse({super.key});

  @override
  State<SearchCourse> createState() => _SearchCourseState();
}

class _SearchCourseState extends State<SearchCourse> {
  late CourseProvider courseProvider1;
  @override
  void initState() {
    courseProvider1 = Provider.of<CourseProvider>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Consumer<SearchCourseProvider>(
            builder: (context, searchCourseProvider, _) => Center(
              child: TextField(
                controller: searchCourseProvider.searchController,
                decoration: InputDecoration(
                  suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          searchCourseProvider.getSearchList();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchCourseProvider.clearSearchList();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body:
          Consumer<SearchCourseProvider>(builder: (context, courseProvider, _) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: courseProvider.searchCourse.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  courseProvider1.checkFav(courseProvider.searchCourse[index]);

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CourseScreen(
                            index: index,
                          )));
                },
                child: VerticalList(
                  course: courseProvider.searchCourse[index],
                ));
          },
        );
      }),
    );
  }
}
