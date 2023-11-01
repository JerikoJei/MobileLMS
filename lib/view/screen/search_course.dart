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
  late SearchCourseProvider courseProvider2;
  @override
  void initState() {
    courseProvider1 = Provider.of<CourseProvider>(context, listen: false);
    courseProvider2 = Provider.of<SearchCourseProvider>(context, listen: false);
    courseProvider2.context = context;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              courseProvider2.back();
            },
          ),
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Consumer<SearchCourseProvider>(
              builder: (context, searchCourseProvider, _) => Center(
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: (String? value) {
                      if (value! == '') {
                        return 'Please enter some text';
                      } else if (value.contains(RegExp(r'[0-9]'))) {
                        return 'Text cannot include number';
                      } else {
                        return null;
                      }
                    },
                    controller: searchCourseProvider.searchController,
                    decoration: InputDecoration(
                      suffixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                searchCourseProvider.getSearchList();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              }
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
        ),
        body: ListView(children: [
          const SizedBox(
            height: 10,
          ),
          Consumer<SearchCourseProvider>(builder: (context, courseProvider, _) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: courseProvider.searchCourse.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      courseProvider1
                          .checkFav(courseProvider.searchCourse[index]);

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
        ]));
  }
}
