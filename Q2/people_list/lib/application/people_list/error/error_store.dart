// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:people_list/untils/log/log.dart';
part 'error_store.g.dart';

class ErrorStore = _ErrorStore with _$ErrorStore;

abstract class _ErrorStore with Store {
  // disposers
  late List<ReactionDisposer> _disposers;

  // constructor:---------------------------------------------------------------
  _ErrorStore() {
    _disposers = [];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String errorMessage = '';

  // actions:-------------------------------------------------------------------
  @action
  void setErrorMessage(String message) {
    errorMessage = message;
  }

  @action
  void reset(String value) {
    Log.debug('calling reset error store.');
    errorMessage = '';
  }

  // dispose:-------------------------------------------------------------------
  @action
  dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
