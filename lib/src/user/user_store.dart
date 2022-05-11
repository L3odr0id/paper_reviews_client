import 'dart:developer';

import 'package:codenames_client/core/models/user.dart';
import 'package:codenames_client/src/user/user_network_service.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final UserNetworkService httpClient = UserNetworkService();

  @observable
  ObservableFuture<User?> user = ObservableFuture.value(null);

  @action
  Future getUser(String login, String password) async {
    try {
      user = ObservableFuture(httpClient.getUser(login, password));
      await user;
    } catch (e) {
      log(e.toString());
    }
  }

  @action
  Future postUser(String login, String password) async {
    try {
      user = ObservableFuture(httpClient.postUser(login, password));
      await user;
    } catch (e) {
      log(e.toString());
    }
  }
}
