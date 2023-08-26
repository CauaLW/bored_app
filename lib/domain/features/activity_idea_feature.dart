import 'package:bored_app/domain/entities/activity_idea_entity.dart';
import 'package:bored_app/domain/failures/failures.dart';
import 'package:bored_app/domain/repositories/activity_idea_repo.dart';
import 'package:dartz/dartz.dart';

class ActivityIdeaFeature {
  final ActivityIdeaRepo repo;

  ActivityIdeaFeature({required this.repo});

  Future<Either<Failure, ActivityIdeaEntity>> getActivityIdea() async {
    return repo.getActivityIdeaFromDataSource();
  }
}
