// import 'package:json_annotation/json_annotation.dart';

// part 'action.g.dart';

// @JsonSerializable()
abstract class Action {
  String get eventName;
  Map<String, dynamic> get data;
}
