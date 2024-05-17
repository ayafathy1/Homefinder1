
import '../models/auth_model.dart';
import '../utilities/api_service.dart';
import '../utilities/services.dart';

class AuthServices{
  static ApiService api = ApiService();
  static Future<AuthModel?> signingIn(String email,String password) async {
    var data = await api.request(Services.signingInEndPoint, "POST",data: {
      "email":email,
      "password":password,
    });
    if (data != null) {
      return AuthModel.fromJson(data);

    }
    return null;
  }
  static Future<AuthModel?> signingUp(String username,String email,String password,String confirmPass) async {
    var data = await api.request(Services.signingUpEndPoint, "POST",data: {
     "username":username,
      "email":email,
      "password":password,
      "confirmPass":confirmPass,
    });
    if (data != null) {
      return AuthModel.fromJson(data);
    }
    return null;
  }
  static Future<AuthModel?> completeSigningUp(String firstName,String lastName,String gender,String phone) async {
    var data = await api.request(Services.signingInEndPoint, "POST",data: {
      "firstName":firstName,
      "lastName":lastName,
      "gender":gender,
      "phone":phone,
    });
    if (data != null) {
      return AuthModel.fromJson(data);
    }
    return null;
  }
  static forgetPassword(String email) async {
    var data = await api.request(Services.forgetPasswordEndPoint, "POST",data: {
      "email":email,
    });
    if (data != null) {

    }
    return null;
  }
}