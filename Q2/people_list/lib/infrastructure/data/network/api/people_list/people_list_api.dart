import 'package:people_list/application/error/error_store.dart';
import 'package:people_list/infrastructure/data/network/api/api_response_model.dart';
import 'package:people_list/infrastructure/data/network/dio/dio_client.dart';
import 'package:people_list/infrastructure/singletons/singletons.dart';
import 'package:people_list/untils/constants/strings.dart';
import 'package:people_list/untils/log/log.dart';

class PeopleListApi {
  final DioClient _dioClient;

  PeopleListApi(this._dioClient);

  // error store: to store error message
  final ErrorStore _errorStore = getIt.get<ErrorStore>();

  // endpoints
  final String getListEndpoint = 'api/events';

  Future<ApiStringResponse?> getPeopleList() async {
    try {
      final res = await _dioClient.get(
        // '${Envs.aaiBaseUrl}/anticollision/api/events',
        'https://api.json-generator.com/templates/-xdNcNKYtTFG/data',
        queryParameters: {},
      );
      // final responseModel = ApiStringResponse.fromJson(res);
      // if (responseModel.data is Map) {
      // return (responseModel.data["list"] as List)
      //     .cast<Map<String, dynamic>>()
      //     .map((e) {
      //   AntiCollisionEvent record = AntiCollisionEvent.fromJson(e);
      //   return record;
      // }).toList();
      return null;
      // } else {
      //   return null;
      // }
    } catch (e) {
      Log.debug(e);
      _errorStore.setErrorMessage(Strings.loadPeopleListError);
    }

    return null;
  }
}
