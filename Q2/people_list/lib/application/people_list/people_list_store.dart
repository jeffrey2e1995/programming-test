// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:people_list/application/error/error_store.dart';
import 'package:people_list/domain/person/model/person.dart';
import 'package:people_list/infrastructure/repositories/people_list/people_list_repository.dart';
import 'package:people_list/infrastructure/singletons/singletons.dart';
import 'package:people_list/untils/constants/strings.dart';
import 'package:people_list/presentation/widgets/dialog_widget.dart';

part 'people_list_store.g.dart';

class PeopleListStore = _PeopleListStore with _$PeopleListStore;

abstract class _PeopleListStore with Store {
  // repository instance
  final PeopleListRepository _repository;

  // constructor:---------------------------------------------------------------
  _PeopleListStore(PeopleListRepository repository) : _repository = repository {
    // _peopleList = _repository.peopleList;
  }

  final ErrorStore _errorStore = getIt.get<ErrorStore>();

  // store variables:-----------------------------------------------------------
  @observable
  List<Person>? _peopleList;
  List<Person>? get peopleList => _peopleList;

  @observable
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _success = false;

  @action
  Future<void> getPeopleList(BuildContext context) async {
    _isLoading = true;
    _success = false;

    try {
      final response = await _repository.getPeopleList();

      if (response != null && response.statusCode == 200) {
        _success = true;
        return;
      }
    } catch (e) {
      _errorStore.setErrorMessage(e.toString());
    }

    if (!_success && context.mounted) {
      DialogWidget.showErrorDialog(
          context, _errorStore.getErrorMessage(Strings.loadPeopleListError));
    }
  }

  @action
  void savePeopleList(List<Person>? list) {
    _peopleList = list;
  }
}
