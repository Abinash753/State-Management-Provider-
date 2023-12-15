import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //login function
  void login(String email, String password) async {
    setLoading(true);
    try {
      Response response = await post(Uri.parse("https://reqres.in/api/login"),
          body: {"email": email, "password": password});

      if (response.statusCode == 200) {
        setLoading(false);
        print("successful");
      } else {
        print("fail to login");
        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
      print(e);
    }
    notifyListeners();
  }
}
