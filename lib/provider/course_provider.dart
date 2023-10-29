import 'package:flutter/material.dart';
import 'package:lms_app/model/course_model.dart';
import 'package:lms_app/service/firebase_service.dart';

class CourseProvider extends ChangeNotifier {
  List<CourseModel> courselist = [];
  String status = '';
  bool isFavg = false;
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
    return watched / videoCourseList.length;
  }

  void isnotwatched(CourseModel courseModel) async {
    await FirebaseService().changeWatchState(
        courseModel.id, courseModel.listvid[currentPlayed].videoid, false);
    courseModel.listvid[currentPlayed].isWatched = false;
    checkWatch(courseModel);
    getCourseList();
    notifyListeners();
  }

  void iswatched(CourseModel courseModel) async {
    await FirebaseService().changeWatchState(
        courseModel.id, courseModel.listvid[currentPlayed].videoid, true);
    courseModel.listvid[currentPlayed].isWatched = true;
    checkWatch(courseModel);
    getCourseList();
    notifyListeners();
  }

  void checkWatch(CourseModel courseModel) {
    if (courseModel.listvid[currentPlayed].isWatched) {
      status = 'watched';
    } else {
      status = 'not watched';
    }
    notifyListeners();
    getCourseList();
  }

  void isFav(CourseModel courseModel) async {
    await FirebaseService().changeFavState(courseModel.id, true);
    courseModel.isFav = true;
    isFavg = true;
    getCourseList();
    notifyListeners();
  }

  void isNotFav(CourseModel courseModel) async {
    await FirebaseService().changeFavState(courseModel.id, false);
    courseModel.isFav = false;
    isFavg = false;
    getCourseList();
    notifyListeners();
  }

  void checkFav(CourseModel courseModel) {
    if (courseModel.isFav) {
      isFavg = true;
    } else {
      isFavg = false;
    }
    notifyListeners();
    getCourseList();
  }
}
