class VideoModel {
  int id;
  String videoid;
  String namavid;
  String vid;
  bool isWatched;

  VideoModel(this.id, this.namavid, this.vid, this.isWatched, this.videoid);

  factory VideoModel.fromMap(Map<String, dynamic> map) => VideoModel(
        map['id'],
        map['namavid'],
        map['vid'],
        map['isWatched'],
        map['videoid'],
      );
}
