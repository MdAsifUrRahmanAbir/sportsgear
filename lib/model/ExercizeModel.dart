import 'Exercises.dart';

class ExercizeModel {
  ExercizeModel({
      this.exercises,});

  ExercizeModel.fromJson(dynamic json) {
    if (json['exercises'] != null) {
      exercises = [];
      json['exercises'].forEach((v) {
        exercises?.add(Exercises.fromJson(v));
      });
    }
  }
  List<Exercises>? exercises;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (exercises != null) {
      map['exercises'] = exercises?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}