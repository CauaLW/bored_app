import 'package:bored_app/domain/entities/activity_idea_entity.dart';
import 'package:equatable/equatable.dart';

class ActivityIdeaModel extends ActivityIdeaEntity with EquatableMixin {
  ActivityIdeaModel({
    required super.key,
    required super.activity,
    required super.accessibility,
    required super.type,
    required super.participants,
    required super.price,
  });

  factory ActivityIdeaModel.fromJson(Map<String, dynamic> json) {
    return ActivityIdeaModel(
      key: json['key'],
      activity: json['activity'],
      accessibility: 1 - (json['accessibility'] as double),
      type: json['type'],
      participants: json['participants'],
      price: 0.0 + json['price'],
    );
  }
}
