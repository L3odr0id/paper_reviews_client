import 'dart:developer';

import 'package:codenames_client/core/models/user.dart';
import 'package:codenames_client/src/user/user_network_service.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

enum Status {
  initial,
  loading,
  loaded,
}

abstract class _UserStore with Store {
  final UserNetworkService httpClient = UserNetworkService();

  @observable
  User? user;

  @observable
  Status status = Status.initial;

  @action
  Future getUser(String login, String password) async {
    status = Status.loading;
    try {
      user = await httpClient.getUser(login, password);
      status = Status.loaded;
    } catch (e) {
      log(e.toString());
    }
  }

  @action
  Future postUser(String login, String password) async {
    status = Status.loading;
    try {
      user = await httpClient.postUser(login, password);
      status = Status.loaded;
    } catch (e) {
      log(e.toString());
    }
  }
}
