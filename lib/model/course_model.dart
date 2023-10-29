import 'package:lms_app/model/video_model.dart';

class CourseModel {
  String id;
  String name;
  String image;
  List<VideoModel> listvid;
  bool isFav;

  CourseModel(this.id, this.name, this.image, this.listvid, this.isFav);

  factory CourseModel.fromMap(Map<String, dynamic> map) => CourseModel(
        map['id'],
        map['name'],
        map['image'],
        map['listvid'],
        map['isFav'],
      );
}
