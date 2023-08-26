import 'package:bored_app/data/datasources/activity_idea_remote_datasource.dart';
import 'package:bored_app/data/exceptions/exceptions.dart';
import 'package:bored_app/data/models/activity_idea_model.dart';
import 'package:bored_app/data/repositories/activity_idea_repo_impl.dart';
import 'package:bored_app/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'activty_idea_repo_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ActivityIdeaRemoteDatasourceImpl>()])
void main() {
  final mockActivityIdeaRemoteDatasource = MockActivityIdeaRemoteDatasourceImpl();
  final activityIdeaRepoImplUnderTest = ActivityIdeaRepoImpl(remoteDatasource: mockActivityIdeaRemoteDatasource);

  group('ActivityIdeaRepoImpl', () {
    group('should return ActivityIdeaEntity', () {
      test('when ActivityIdeaRemoteDatasource returns an ActivityIdeaModel', () async {
        final ActivityIdeaModel testModel = ActivityIdeaModel(key: '1', activity: 'Test Activity', accessibility: 0.5, type: 'diy', participants: 1, price: 0.1);
        when(mockActivityIdeaRemoteDatasource.getRandomActivityIdeaFromApi()).thenAnswer((realInvocation) => Future.value(testModel));

        final result = await activityIdeaRepoImplUnderTest.getActivityIdeaFromDataSource();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, ActivityIdeaModel>(testModel));
      });
    });
    group('should return left with', () {
      test('ServerFailure when a ServerException occurs', () async {
        when(mockActivityIdeaRemoteDatasource.getRandomActivityIdeaFromApi()).thenThrow(ServerException());

        final result = await activityIdeaRepoImplUnderTest.getActivityIdeaFromDataSource();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, ActivityIdeaModel>(ServerFailure()));
      });
      test('GeneralFailure when another Exception occurs', () async {
        when(mockActivityIdeaRemoteDatasource.getRandomActivityIdeaFromApi()).thenThrow(UnimplementedError());

        final result = await activityIdeaRepoImplUnderTest.getActivityIdeaFromDataSource();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, ActivityIdeaModel>(GeneralFailure()));
      });
    });
  });
}
