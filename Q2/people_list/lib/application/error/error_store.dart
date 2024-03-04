// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
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
  String _errorMessage = '';

  String getErrorMessage(String defaultMessage) {
    return kDebugMode
        ? _errorMessage.isEmpty
            ? defaultMessage
            : _errorMessage
        : defaultMessage;
  }

  // actions:-------------------------------------------------------------------
  @action
  void setErrorMessage(String message) {
    _errorMessage = message;
  }

  @action
  void reset(String value) {
    Log.debug('calling reset');
    _errorMessage = '';
  }

  // dispose:-------------------------------------------------------------------
  @action
  dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
