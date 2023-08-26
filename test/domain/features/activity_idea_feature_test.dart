import 'package:bored_app/data/repositories/activity_idea_repo_impl.dart';
import 'package:bored_app/domain/entities/activity_idea_entity.dart';
import 'package:bored_app/domain/failures/failures.dart';
import 'package:bored_app/domain/features/activity_idea_feature.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'activity_idea_feature_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ActivityIdeaRepoImpl>()])
void main() {
  final mockActivityIdeaRepoImpl = MockActivityIdeaRepoImpl();
  final activityIdeaFeatureUnderTest = ActivityIdeaFeature(repo: mockActivityIdeaRepoImpl);
  group('Activity Idea Feature', () {
    group('should return ActivityIdeaEntity', () {
      test('when ActivityIdeaRepoImpl returns an ActivityIdeaEntity', () async {
        const ActivityIdeaEntity activityIdeaForTest = ActivityIdeaEntity(key: '1', activity: 'Activity Test', accessibility: 0.5, type: 'diy', participants: 1, price: 0.7);
        when(mockActivityIdeaRepoImpl.getActivityIdeaFromDataSource()).thenAnswer(
          (realInvocation) => Future.value(
            const Right<Failure, ActivityIdeaEntity>(
              activityIdeaForTest,
            ),
          ),
        );

        final result = await activityIdeaFeatureUnderTest.getActivityIdea();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, const Right<Failure, ActivityIdeaEntity>(activityIdeaForTest));
      });
    });
    group('should return left with', () {
      test('a ServerFailure', () async {
        final Failure testFailure = ServerFailure();
        when(mockActivityIdeaRepoImpl.getActivityIdeaFromDataSource()).thenAnswer(
          (realInvocation) => Future.value(
            Left<Failure, ActivityIdeaEntity>(testFailure),
          ),
        );

        final result = await activityIdeaFeatureUnderTest.getActivityIdea();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, ActivityIdeaEntity>(testFailure));
      });
      test('a GeneralFailure', () async {
        final Failure testFailure = GeneralFailure();
        when(mockActivityIdeaRepoImpl.getActivityIdeaFromDataSource()).thenAnswer(
          (realInvocation) => Future.value(
            Left<Failure, ActivityIdeaEntity>(testFailure),
          ),
        );

        final result = await activityIdeaFeatureUnderTest.getActivityIdea();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, ActivityIdeaEntity>(testFailure));
      });
    });
  });
}
