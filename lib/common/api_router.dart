class ApiRouter {
  final url = 'https://reports-backend.herokuapp.com';

  String get reportsAll => url + '/reports';
  String get reportPost => url + '/report/';
}
