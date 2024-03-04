import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:people_list/application/people_list/people_list_store.dart';
import 'package:people_list/infrastructure/data/network/api/people_list/people_list_api.dart';
import 'package:people_list/infrastructure/data/network/dio/dio_client.dart';
import 'package:people_list/infrastructure/data/network/dio/dio_provider.dart';
import 'package:people_list/infrastructure/repositories/people_list/people_list_repository.dart';

final getIt = GetIt.instance;

Future<void> setupSingletons() async {
  // network
  getIt.registerSingleton<Dio>(DioProvider.provideDio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));

  // people-list
  getIt.registerSingleton(PeopleListApi(getIt.get<DioClient>()));
  getIt.registerSingleton(PeopleListRepository(getIt.get<PeopleListApi>()));
  getIt.registerSingleton(PeopleListStore(getIt<PeopleListRepository>()));
}
