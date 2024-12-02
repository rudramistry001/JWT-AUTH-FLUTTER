
import 'package:http_interceptor/http_interceptor.dart';
import 'package:jwt_starter/view%20model/register_viewmodel.dart';


class AuthInterceptor implements InterceptorContract {
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    // String? authToken = await StorageService().readSecureData('authToken');
    try {
      RegisterViewModel registerViewModel = RegisterViewModel();
      request.headers['Content-Type'] = 'application/json';
      request.headers['Authorization'] =
          'Bearer ${await registerViewModel.getUserAccessToken()}';
      // request.headers['Authorization'] = 'Bearer $authToken';
    } catch (e) {
      throw e.toString();
    }
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse(
          {required BaseResponse response}) async =>
      response;

  @override
  Future<bool> shouldInterceptRequest() async {
    bool intercept = await getIntercept();
    return intercept;
  }

  @override
  Future<bool> shouldInterceptResponse() async {
    bool intercept = await getIntercept();
    return intercept;
  }

  getIntercept() {
    return true;
  }
}
