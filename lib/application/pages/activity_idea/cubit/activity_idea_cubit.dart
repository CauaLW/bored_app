import 'package:bored_app/domain/entities/activity_idea_entity.dart';
import 'package:bored_app/domain/features/activity_idea_feature.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'activity_idea_state.dart';

class ActivityIdeaCubit extends Cubit<ActivityIdeaState> {
  final ActivityIdeaFeature feature;
  ActivityIdeaCubit({required this.feature}) : super(ActivityIdeaStateInitial());

  void requestIdea() async {
    emit(ActivityIdeaStateLoading());

    final failureOrActivityIdea = await feature.getActivityIdea();

    failureOrActivityIdea.fold(
      (failure) => emit(ActivityIdeaStateError(errorMessage: failure.message)),
      (activityIdea) => emit(ActivityIdeaStateLoaded(activityIdea: activityIdea)),
    );
  }
}
