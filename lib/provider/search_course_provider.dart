import 'package:flutter/material.dart';
import 'package:lms_app/model/course_model.dart';
import 'package:lms_app/service/firebase_service.dart';

class SearchCourseProvider extends ChangeNotifier {
  List<CourseModel> searchCourse = [];
  FirebaseService firebase = FirebaseService();
  TextEditingController searchController = TextEditingController();
  late BuildContext context;

  void getSearchList() async {
    searchCourse = await firebase.getSearchCourse(searchController.text);
    notifyListeners();
  }

  void clearSearchList() {
    searchController.clear();
  }

  void back() {
    searchCourse.clear();
    searchController.clear();
    Navigator.pop(context);
  }
}
