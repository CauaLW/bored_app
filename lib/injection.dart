import 'package:bored_app/application/pages/activity_idea/cubit/activity_idea_cubit.dart';
import 'package:bored_app/data/datasources/activity_idea_remote_datasource.dart';
import 'package:bored_app/data/repositories/activity_idea_repo_impl.dart';
import 'package:bored_app/domain/features/activity_idea_feature.dart';
import 'package:bored_app/domain/repositories/activity_idea_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.I;

Future<void> init() async {
  // Application Layer
  serviceLocator.registerFactory<ActivityIdeaCubit>(() => ActivityIdeaCubit(feature: serviceLocator()));

  // Domain Layer
  serviceLocator.registerFactory<ActivityIdeaFeature>(() => ActivityIdeaFeature(repo: serviceLocator()));

  // Data Layer
  serviceLocator.registerFactory<ActivityIdeaRepo>(() => ActivityIdeaRepoImpl(remoteDatasource: serviceLocator()));
  serviceLocator.registerFactory<ActivityIdeaRemoteDatasource>(() => ActivityIdeaRemoteDatasourceImpl(client: serviceLocator()));

  // Externs
  serviceLocator.registerFactory<http.Client>(() => http.Client());
}
