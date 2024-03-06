// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PeopleListStore on _PeopleListStore, Store {
  late final _$_peopleListAtom =
      Atom(name: '_PeopleListStore._peopleList', context: context);

  @override
  List<Person>? get _peopleList {
    _$_peopleListAtom.reportRead();
    return super._peopleList;
  }

  @override
  set _peopleList(List<Person>? value) {
    _$_peopleListAtom.reportWrite(value, super._peopleList, () {
      super._peopleList = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: '_PeopleListStore._isLoading', context: context);

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_currentPersonAtom =
      Atom(name: '_PeopleListStore._currentPerson', context: context);

  @override
  Person? get _currentPerson {
    _$_currentPersonAtom.reportRead();
    return super._currentPerson;
  }

  @override
  set _currentPerson(Person? value) {
    _$_currentPersonAtom.reportWrite(value, super._currentPerson, () {
      super._currentPerson = value;
    });
  }

  late final _$getPeopleListAsyncAction =
      AsyncAction('_PeopleListStore.getPeopleList', context: context);

  @override
  Future<void> getPeopleList(BuildContext context) {
    return _$getPeopleListAsyncAction.run(() => super.getPeopleList(context));
  }

  late final _$_PeopleListStoreActionController =
      ActionController(name: '_PeopleListStore', context: context);

  @override
  void savePeopleList(List<Person>? list) {
    final _$actionInfo = _$_PeopleListStoreActionController.startAction(
        name: '_PeopleListStore.savePeopleList');
    try {
      return super.savePeopleList(list);
    } finally {
      _$_PeopleListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentPerson(Person? p) {
    final _$actionInfo = _$_PeopleListStoreActionController.startAction(
        name: '_PeopleListStore.setCurrentPerson');
    try {
      return super.setCurrentPerson(p);
    } finally {
      _$_PeopleListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPeopleList(List<Person> list) {
    final _$actionInfo = _$_PeopleListStoreActionController.startAction(
        name: '_PeopleListStore.setPeopleList');
    try {
      return super.setPeopleList(list);
    } finally {
      _$_PeopleListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
