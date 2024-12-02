

import 'package:jwt_starter/model/auth_model.dart';
import 'package:jwt_starter/services/register_service.dart';

class RegisterRepository {
  RegisterServices registerServices = RegisterServices();

  Future registerUser(RegisterModel register) async {
    final response = await registerServices.registerUser(register);
    return response;
  }

  Future loginUser(RegisterModel loginUser) async {
    final response = await registerServices.loginUser(loginUser);
    return response;
  }
}
