import 'package:codenames_client/common/api_router.dart';
import 'package:codenames_client/core/models/user.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UserNetworkService {
  Future<User> getUser(String login, String password) async {
    final dio = Get.find<Dio>();
    final userUrl = Get.find<ApiRouter>().userGet(login);

    final response = await dio.get(
      userUrl,
      queryParameters: {'password': password},
    );

    if (response.statusCode == 200) {
      return User(login: login);
    } else {
      throw "Error in $userUrl";
    }
  }

  Future<User> postUser(String login, String password) async {
    final dio = Get.find<Dio>();
    final userUrl = Get.find<ApiRouter>().userPost;

    final response = await dio.post(userUrl, data: {
      'password': password,
      'login': login,
    });

    if (response.statusCode == 200) {
      return User(login: login);
    } else {
      throw "Error in $userUrl";
    }
  }
}
