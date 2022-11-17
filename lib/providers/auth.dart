import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;

  Future<void> _authenticate(
    String email,
    String password,
    String urlSegment,
  ) async {
    Uri url = Uri.parse(
      'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyAJX_MrqlS9F0vFqsnuzOsfAlo9FKKeGNg',
    );

    final response = await http.post(
      url,
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );

    log(json.decode(response.body).toString());
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
