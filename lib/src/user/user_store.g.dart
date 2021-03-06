// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  final _$userAtom = Atom(name: '_UserStore.user');

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$statusAtom = Atom(name: '_UserStore.status');

  @override
  Status get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(Status value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$getUserAsyncAction = AsyncAction('_UserStore.getUser');

  @override
  Future<dynamic> getUser(String login, String password) {
    return _$getUserAsyncAction.run(() => super.getUser(login, password));
  }

  final _$postUserAsyncAction = AsyncAction('_UserStore.postUser');

  @override
  Future<dynamic> postUser(String login, String password) {
    return _$postUserAsyncAction.run(() => super.postUser(login, password));
  }

  @override
  String toString() {
    return '''
user: ${user},
status: ${status}
    ''';
  }
}
