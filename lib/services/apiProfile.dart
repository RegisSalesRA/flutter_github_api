import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/profile.dart';

class ProfileState with ChangeNotifier {
  List<Profile> _profile = [];

  Future<bool> getUser() async {
    var url = Uri.parse('https://api.github.com/users/RegisSalesRA');

    try {
      http.Response response = await http.get(url, headers: {
        "Content-Type": "application/json",
      });
      var data = json.decode(response.body) as List;
      List<Profile> temp = [];
      data.forEach((element) {
        Profile perfil = Profile.fromJson(element);
        temp.add(perfil);
      });
      _profile = temp;
      notifyListeners();
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return false;
    }
  }

  List<Profile> get perfil {
    return [..._profile];
  }
}
