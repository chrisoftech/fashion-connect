import 'package:fashion_connect/models/models.dart';
import 'package:meta/meta.dart';

class AuthRepository {
  Future<bool> isAuthenticated() async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }

  Future<String> authenticate(
      {@required String username,
      @required String password,
      @required AuthMode authMode}) async {
    await Future.delayed(Duration(seconds: 2));

    if (authMode == AuthMode.Login) {
      print('Login');
    } else {
      print('Sign up');
    }
    
    return 'token';
  }

  Future<void> persistUser({@required User user}) async {
    await Future.delayed(Duration(seconds: 2));
    print(user.toString());
    return;
  }

  Future<void> signout() async {
    await Future.delayed(Duration(seconds: 2));
    print('signed out');
    return;
  }
}
