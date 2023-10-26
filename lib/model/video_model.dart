class VideoModel {
  int id;
  String namavid;
  String vid;

  VideoModel(this.id, this.namavid, this.vid);

  factory VideoModel.fromMap(Map<String, dynamic> map) => VideoModel(
        map['id'],
        map['namavid'],
        map['vid'],
      );
}
