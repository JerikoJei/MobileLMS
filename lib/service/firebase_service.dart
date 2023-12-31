import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lms_app/model/course_model.dart';
import 'package:lms_app/model/video_model.dart';

class FirebaseService {
  Future<List<CourseModel>> getCourse() async {
    final List<CourseModel> courselist = [];
    await FirebaseFirestore.instance
        .collection('course')
        .get()
        .then((value) async {
      for (var doc in value.docs) {
        final docdata = doc.data();
        Map<String, dynamic> map = {
          'name': docdata['name'],
          'image': docdata['image'],
          'id': doc.id,
          'isFav': docdata['isFav'],
        };
        List<VideoModel> listvid = [];
        await FirebaseFirestore.instance
            .collection('course')
            .doc(doc.id)
            .collection('vid')
            .get()
            .then((value) {
          for (var doc1 in value.docs) {
            final docdata1 = doc1.data();
            docdata1['videoid'] = doc1.id;
            listvid.add(VideoModel.fromMap(docdata1));
          }
        });
        map['listvid'] = listvid;
        final CourseModel data = CourseModel.fromMap(map);
        courselist.add(data);
      }
    });
    return courselist;
  }

  Future<void> changeWatchState(
      String courseId, String videoId, bool watchingState) async {
    await FirebaseFirestore.instance
        .collection('course')
        .doc(courseId)
        .collection('vid')
        .doc(videoId)
        .update({'isWatched': watchingState});
  }

  Future<void> changeFavState(String courseId, bool favState) async {
    await FirebaseFirestore.instance
        .collection('course')
        .doc(courseId)
        .update({'isFav': favState});
  }

  Future<List<CourseModel>> getFavCourse() async {
    final List<CourseModel> favCourselist = [];

    await FirebaseFirestore.instance
        .collection('course')
        .where('isFav', isEqualTo: true)
        .get()
        .then((value) async {
      for (var doc in value.docs) {
        final docdata = doc.data();
        Map<String, dynamic> map = {
          'name': docdata['name'],
          'image': docdata['image'],
          'id': doc.id,
          'isFav': docdata['isFav'],
        };
        List<VideoModel> listvid = [];
        await FirebaseFirestore.instance
            .collection('course')
            .doc(doc.id)
            .collection('vid')
            .get()
            .then((value) {
          for (var doc1 in value.docs) {
            final docdata1 = doc1.data();
            docdata1['videoid'] = doc1.id;
            listvid.add(VideoModel.fromMap(docdata1));
          }
        });
        map['listvid'] = listvid;
        final CourseModel data = CourseModel.fromMap(map);
        favCourselist.add(data);
      }
    });
    return favCourselist;
  }

  Future<List<CourseModel>> getSearchCourse(String nama) async {
    final List<CourseModel> favCourselist = [];

    await FirebaseFirestore.instance
        .collection('course')
        .where('name', isEqualTo: nama)
        .get()
        .then((value) async {
      for (var doc in value.docs) {
        final docdata = doc.data();
        Map<String, dynamic> map = {
          'name': docdata['name'],
          'image': docdata['image'],
          'id': doc.id,
          'isFav': docdata['isFav'],
        };
        List<VideoModel> listvid = [];
        await FirebaseFirestore.instance
            .collection('course')
            .doc(doc.id)
            .collection('vid')
            .get()
            .then((value) {
          for (var doc1 in value.docs) {
            final docdata1 = doc1.data();
            docdata1['videoid'] = doc1.id;
            listvid.add(VideoModel.fromMap(docdata1));
          }
        });
        map['listvid'] = listvid;
        final CourseModel data = CourseModel.fromMap(map);
        favCourselist.add(data);
      }
    });
    return favCourselist;
  }
}
