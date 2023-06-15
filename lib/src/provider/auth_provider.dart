import 'package:banana_software_challenge/src/services/challenge_services.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  dynamic authLogin;
  Future<dynamic> auth(String user, String password) async {
    authLogin = ChallengeServices().login(
      user,
      password,
    );
    notifyListeners();
    return authLogin;
  }
}
