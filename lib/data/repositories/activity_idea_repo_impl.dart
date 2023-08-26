import 'package:bored_app/data/datasources/activity_idea_remote_datasource.dart';
import 'package:bored_app/data/exceptions/exceptions.dart';
import 'package:bored_app/domain/entities/activity_idea_entity.dart';
import 'package:bored_app/domain/failures/failures.dart';
import 'package:bored_app/domain/repositories/activity_idea_repo.dart';
import 'package:dartz/dartz.dart';

class ActivityIdeaRepoImpl implements ActivityIdeaRepo {
  final ActivityIdeaRemoteDatasource remoteDatasource;

  ActivityIdeaRepoImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, ActivityIdeaEntity>> getActivityIdeaFromDataSource() async {
    try {
      final result = await remoteDatasource.getRandomActivityIdeaFromApi();

      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (_) {
      return left(GeneralFailure());
    }
  }
}
