// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/repository.dart';
import '../models/starred.dart';

class RepositoryState with ChangeNotifier {
  List<Repository> _repositorys = [];
  List<Starred> _starreds = [];

  Future<bool> getRepos() async {
    var url = Uri.parse('https://api.github.com/users/RegisSalesRA/repos');

    try {
      http.Response response = await http.get(url, headers: {
        "Content-Type": "application/json",
      });
      var data = json.decode(response.body) as List;
      List<Repository> temp = [];
      // ignore: avoid_function_literals_in_foreach_calls
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

  Future<bool> getStarred() async {
    var url = Uri.parse('https://api.github.com/users/RegisSalesRA/starred');

    try {
      http.Response response = await http.get(url, headers: {
        "Content-Type": "application/json",
      });
      var data = json.decode(response.body) as List;
      List<Starred> temp = [];
      // ignore: avoid_function_literals_in_foreach_calls
      data.forEach((element) {
        Starred starrepo = Starred.fromJson(element);
        temp.add(starrepo);
      });
      _starreds = temp;
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

  List<Starred> get starredRepos {
    return [..._starreds];
  }
}
