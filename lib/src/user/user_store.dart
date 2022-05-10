import 'dart:developer';

import 'package:codenames_client/core/models/user.dart';
import 'package:codenames_client/src/user/user_network_service.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final UserNetworkService httpClient = UserNetworkService();

  @observable
  User? user;

  @action
  Future getUser(String login, String password) async {
    try {
      if (await httpClient.getUser(login, password)) {
        user = User(login: login);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @action
  Future postUser(String login, String password) async {
    try {
      if (await httpClient.postUser(login, password)) {
        user = User(login: login);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
