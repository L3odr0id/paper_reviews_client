// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enter_room.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EnterRoom on EnterRoomBase, Store {
  final _$valueAtom = Atom(name: 'EnterRoomBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$EnterRoomBaseActionController =
      ActionController(name: 'EnterRoomBase');

  @override
  void increment() {
    final _$actionInfo = _$EnterRoomBaseActionController.startAction(
        name: 'EnterRoomBase.increment');
    try {
      return super.increment();
    } finally {
      _$EnterRoomBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
