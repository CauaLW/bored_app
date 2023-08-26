import 'package:bored_app/domain/entities/activity_idea_entity.dart';
import 'package:bored_app/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ActivityIdeaRepo {
  Future<Either<Failure, ActivityIdeaEntity>> getActivityIdeaFromDataSource();
}