
import '../utilities/api_service.dart';
import '../utilities/services.dart';

class AuthServices{
  static ApiService api = ApiService();
  static signingIn(String email,String password) async {
    var data = await api.request(Services.signingInEndPoint, "POST",data: {
      "email":email,
      "password":password,
    });
    if (data != null) {

    }
    return null;
  }
}