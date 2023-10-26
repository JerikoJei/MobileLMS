import 'package:lms_app/model/video_model.dart';

class CourseModel {
  String name;
  String image;
  List<VideoModel> listvid;

  CourseModel(
    this.name,
    this.image,
    this.listvid,
  );

  factory CourseModel.fromMap(Map<String, dynamic> map) => CourseModel(
        map['name'],
        map['image'],
        map['listvid'],
      );
}
