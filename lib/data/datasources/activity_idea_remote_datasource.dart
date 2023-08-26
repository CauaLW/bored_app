import 'dart:convert';

import 'package:bored_app/data/exceptions/exceptions.dart';
import 'package:bored_app/data/models/activity_idea_model.dart';
import 'package:http/http.dart' as http;

const String _baseUrl = 'https://www.boredapi.com/api';

abstract class ActivityIdeaRemoteDatasource {
  /// Requests a random activity idea from the API
  /// Returns an [ActivityIdeaModel] if success
  /// Trows a server Exception
  Future<ActivityIdeaModel> getRandomActivityIdeaFromApi();
}

class ActivityIdeaRemoteDatasourceImpl implements ActivityIdeaRemoteDatasource {
  final http.Client client;

  ActivityIdeaRemoteDatasourceImpl({required this.client});

  @override
  Future<ActivityIdeaModel> getRandomActivityIdeaFromApi() async {
    final http.Response response = await client.get(
      Uri.parse('$_baseUrl/activity'),
      headers: {
        'content-type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      return throw ServerException();
    }

    final responseBody = json.decode(response.body);

    return ActivityIdeaModel.fromJson(responseBody);
  }
}
