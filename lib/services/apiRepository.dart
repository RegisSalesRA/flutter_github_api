import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../models/repository.dart';

class RepositoryState with ChangeNotifier {
  List<Repository> _repositorys = [];

  Future<bool> getRepos() async {
    var url = Uri.parse('https://api.github.com/users/RegisSalesRA/repos');

    try {
      http.Response response = await http.get(url, headers: {
        "Content-Type": "application/json",
      });
      var data = json.decode(response.body) as List;
      List<Repository> temp = [];
      data.forEach((element) {
        Repository repo = Repository.fromJson(element);
        temp.add(repo);
      });
      _repositorys = temp;
      notifyListeners();
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return false;
    }
  }

  List<Repository> get repos {
    return [..._repositorys];
  }
}
