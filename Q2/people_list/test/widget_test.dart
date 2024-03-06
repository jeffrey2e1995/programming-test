// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:people_list/infrastructure/data/network/api/people_list/people_list_api.dart';
import 'package:people_list/infrastructure/singletons/singletons.dart';

import 'package:people_list/utils/constants/env.dart';

void main() async {
  group('Test Get List API', () {
    test('returns a list when http response is successful', () async {
      // Load env file
      await dotenv.load(fileName: "env/.env");

      // setup environment
      await setupSingletons();

      expect(await getIt.get<PeopleListApi>().getPeopleList(), isA<List>());
    });

    test('return error message when http response is unsuccessful', () async {
      // Load env file
      await dotenv.load(fileName: "env/.env");
      // Set token to empty
      Envs.apiGetListToken = '';
      // setup environment
      await setupSingletons();

      expect(await getIt.get<PeopleListApi>().getPeopleList(), isA<Null>());
    });
  });
}
