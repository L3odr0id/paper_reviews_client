import 'package:codenames_client/core/models/report.dart';
import 'package:codenames_client/main.dart';

class ApiRouter {
  final url = isProd
      ? 'https://reports-backend.herokuapp.com'
      : 'https://localhost:3000/';

  String get reportsAll => url + '/reports';
  String get reportPost => url + '/report/';
  String get reportPut => url + '/report/';
  String reportDelete(Report report) => url + '/report/' + report.id;

  String userGet(String login) => url + '/user/' + login;
  String get userPost => url + '/user/';
}
