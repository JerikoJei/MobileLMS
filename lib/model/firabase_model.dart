class CourseModel {
  String name;
  String image;

  CourseModel(
    this.name,
    this.image,
  );

  factory CourseModel.fromMap(Map<String, dynamic> map) => CourseModel(
        map['name'],
        map['image'],
      );
}
