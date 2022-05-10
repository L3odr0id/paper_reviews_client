import 'package:codenames_client/common/api_router.dart';
import 'package:codenames_client/core/models/user.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UserNetworkService {
  Future<bool> getUser(String login, String password) async {
    final dio = Get.find<Dio>();
    final userUrl = Get.find<ApiRouter>().userGet(login);

    final response = await dio.get(
      userUrl,
      queryParameters: {'password': password},
    );

    if (response.statusCode == 200) {
      return response.data['success'];
    } else {
      throw "Error in $userUrl";
    }
  }

  Future<bool> postUser(String login, String password) async {
    final dio = Get.find<Dio>();
    final userUrl = Get.find<ApiRouter>().userPost;

    final response = await dio.post(userUrl, data: {
      'password': password,
      'login': login,
    });

    if (response.statusCode == 200) {
      return response.data['success'];
    } else {
      throw "Error in $userUrl";
    }
  }
}
