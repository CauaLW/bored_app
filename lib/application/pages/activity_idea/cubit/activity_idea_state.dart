part of 'activity_idea_cubit.dart';

abstract class ActivityIdeaState {
  const ActivityIdeaState();
}

class ActivityIdeaStateInitial extends ActivityIdeaState {}

class ActivityIdeaStateLoading extends ActivityIdeaState {}

class ActivityIdeaStateLoaded extends ActivityIdeaState {
  final ActivityIdeaEntity activityIdea;

  const ActivityIdeaStateLoaded({required this.activityIdea});
}

class ActivityIdeaStateError extends ActivityIdeaState {
  final String errorMessage;

  const ActivityIdeaStateError({required this.errorMessage});
}
