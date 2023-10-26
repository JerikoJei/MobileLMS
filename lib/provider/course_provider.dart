import 'package:flutter/material.dart';
import 'package:lms_app/model/course_model.dart';
import 'package:lms_app/service/firebase_service.dart';

class CourseProvider extends ChangeNotifier {
  List<CourseModel> courselist = [];
  int currentPlayed = 0;
  CourseProvider() {
    getCourseList();
  }
  void getCourseList() async {
    courselist = await FirebaseService().getCourse();

    notifyListeners();
  }

  double watchProgress(CourseModel courseModel) {
    int watched = 0;
    final videoCourseList = courseModel.listvid;

    for (var vid in videoCourseList) {
      if (vid.isWatched) {
        watched++;
      }
    }
    print('=>${watched}');
    return watched / videoCourseList.length;
  }

  void isnotwatched(CourseModel courseModel) async {
    await FirebaseService().changeWatchState(
        courseModel.id, courseModel.listvid[currentPlayed].videoid, false);
    getCourseList();
    notifyListeners();
  }

  void iswatched(
    CourseModel courseModel,
  ) async {
    await FirebaseService().changeWatchState(
        courseModel.id, courseModel.listvid[currentPlayed].videoid, true);
    getCourseList();
    notifyListeners();
  }
}
