abstract class EndPoints {
  static const String prodBaseUrl = 'https://api.garanti.az/api';
  static const String devBaseUrl = 'https://api.garanti.az/api';

  static const String _v1 = '/v1';
  static const String _v2 = '/v2';

  static const excludeEndpoints = <String>[
    login,
  ];

  //! without token
  static const String login = '$_v1/auth/login/';

  //! with token

}
