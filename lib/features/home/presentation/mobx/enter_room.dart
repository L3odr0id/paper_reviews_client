import 'package:mobx/mobx.dart';

part 'enter_room.g.dart';

// class Contact = ContactBase with _$Contact;

class EnterRoom = EnterRoomBase with _$EnterRoom;

abstract class EnterRoomBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
