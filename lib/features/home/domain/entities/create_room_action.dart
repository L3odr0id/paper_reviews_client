import 'package:codenames_client/core/models/action.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_room_action.g.dart';

@JsonSerializable()
class CreateRoomAction extends Action {
  @override
  Map<String, dynamic> data = {};

  @override
  final String eventName = 'create_room';

  Map<String, dynamic> toJson() => _$CreateRoomActionToJson(this);
}
