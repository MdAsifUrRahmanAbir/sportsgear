class Exercises {
  Exercises({
      this.id, 
      this.title, 
      this.thumbnail, 
      this.gif, 
      this.seconds,});

  Exercises.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    gif = json['gif'];
    seconds = json['seconds'];
  }
  String? id;
  String? title;
  String? thumbnail;
  String? gif;
  String? seconds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['thumbnail'] = thumbnail;
    map['gif'] = gif;
    map['seconds'] = seconds;
    return map;
  }

}