import 'package:lms_app/model/video_model.dart';

class CourseModel {
  String id;
  String name;
  String image;
  List<VideoModel> listvid;

  CourseModel(
    this.id,
    this.name,
    this.image,
    this.listvid,
  );

  factory CourseModel.fromMap(Map<String, dynamic> map) => CourseModel(
        map['id'],
        map['name'],
        map['image'],
        map['listvid'],
      );
}
