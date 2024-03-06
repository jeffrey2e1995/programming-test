// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:people_list/application/error/error_store.dart';
import 'package:people_list/domain/person/model/person.dart';
import 'package:people_list/infrastructure/repositories/people_list/people_list_repository.dart';
import 'package:people_list/infrastructure/singletons/singletons.dart';
import 'package:people_list/utils/constants/strings.dart';
import 'package:people_list/presentation/widgets/dialog_widget.dart';

part 'people_list_store.g.dart';

class PeopleListStore = _PeopleListStore with _$PeopleListStore;

abstract class _PeopleListStore with Store {
  // repository instance
  final PeopleListRepository _repository;

  // constructor:---------------------------------------------------------------
  _PeopleListStore(PeopleListRepository repository) : _repository = repository {
    repository.peopleList.then((list) {
      setPeopleList(list);
    });
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

  @observable
  Person? _currentPerson;
  Person? get currentPerson => _currentPerson;

  @action
  Future<void> getPeopleList(BuildContext context) async {
    _isLoading = true;
    _success = false;

    try {
      final peopleList = await _repository.getPeopleList();

      if (peopleList != null) {
        _success = true;
        _isLoading = false;
        savePeopleList(peopleList);
        return;
      }
    } catch (e) {
      _errorStore.setErrorMessage(e.toString());
    }

    _isLoading = false;
    if (!_success && context.mounted) {
      DialogWidget.showErrorDialog(
        context,
        _errorStore.getErrorMessage(
          Strings.loadPeopleListError,
        ),
      );
    }
  }

  @action
  void savePeopleList(List<Person>? list) {
    _peopleList = list;
    if (list != null) {
      _repository.savePeopleList(list);
    }
  }

  @action
  void setCurrentPerson(Person? p) {
    _currentPerson = p;
  }

  @action
  void setPeopleList(List<Person> list) {
    _peopleList = list;
  }
}
