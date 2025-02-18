import 'package:task/dio_client.dart';

import 'enviourment.dart';

class ApplicationApiClient extends DioClient {
  ApplicationApiClient()
      : super(
            baseUrl: Enviorment.instance.userBaseUrl,
            isAuthenticatorRequired: true);
}
