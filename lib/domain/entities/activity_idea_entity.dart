import 'package:equatable/equatable.dart';

class ActivityIdeaEntity with EquatableMixin {
  final String key;
  final String activity;
  final double accessibility;
  final String type;
  final int participants;
  final double price;

  const ActivityIdeaEntity({
    required this.key,
    required this.activity,
    required this.accessibility,
    required this.type,
    required this.participants,
    required this.price,
  });

  @override
  List<Object?> get props => [key, activity, accessibility, type, participants, price];
}
