import 'package:flutter/material.dart';
import 'package:lms_app/model/course_model.dart';
import 'package:lms_app/service/firebase_service.dart';

class CourseProvider extends ChangeNotifier {
  List<CourseModel> courselist = [];
  CourseProvider() {
    getCourseList();
  }
  void getCourseList() async {
    courselist = await FirebaseService().getCourse();

    notifyListeners();
  }
}
