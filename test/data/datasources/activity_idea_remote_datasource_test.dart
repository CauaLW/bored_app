import 'package:bored_app/data/datasources/activity_idea_remote_datasource.dart';
import 'package:bored_app/data/exceptions/exceptions.dart';
import 'package:bored_app/data/models/activity_idea_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'activity_idea_remote_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  group('ActivityIdeaRemoteDatasource', () {
    const String baseUrl = 'https://www.boredapi.com/api';
    final mockClient = MockClient();

    final activityIdeaRemoteDatasourceUnderTest = ActivityIdeaRemoteDatasourceImpl(client: mockClient);

    group('should return ActivityIdeaModel', () {
      test('when client is response is 200 and has valid data', () async {
        const String responseBody = '{"key": "01", "activity":"Learn a new recipe", "accessibility":0.05, "type":"cooking", "participants":1, "price":0}';
        when(
          mockClient.get(
            Uri.parse('$baseUrl/activity'),
            headers: {
              'content-type': 'application/json',
            },
          ),
        ).thenAnswer((realInvocation) => Future.value(http.Response(responseBody, 200)));

        final result = await activityIdeaRemoteDatasourceUnderTest.getRandomActivityIdeaFromApi();

        // When accessibility is converted, the calc 1.0 - accessibility is made
        expect(result, ActivityIdeaModel(key: '01', activity: 'Learn a new recipe', accessibility: 0.95, type: 'cooking', participants: 1, price: 0));
      });
    });
    group('should throw', () {
      test('a ServerException when client status is different from 200', () async {
        when(
          mockClient.get(
            Uri.parse('$baseUrl/activity'),
            headers: {
              'content-type': 'application/json',
            },
          ),
        ).thenAnswer((realInvocation) => Future.value(http.Response('', 500)));

        expect(() => activityIdeaRemoteDatasourceUnderTest.getRandomActivityIdeaFromApi(), throwsA(isA<ServerException>()));
      });
      test('a TypeError when client status is 200 and has no valid data', () async {
        when(
          mockClient.get(
            Uri.parse('$baseUrl/activity'),
            headers: {
              'content-type': 'application/json',
            },
          ),
        ).thenAnswer((realInvocation) => Future.value(http.Response('', 200)));

        expect(() => activityIdeaRemoteDatasourceUnderTest.getRandomActivityIdeaFromApi(), throwsA(isA<FormatException>()));
      });
    });
  });
}
