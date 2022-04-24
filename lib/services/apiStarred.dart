import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('https://api.github.com/users/RegisSalesRA'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final String login;
  final String avatar_url;
  const Album({
    required this.login,
    required this.avatar_url,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      avatar_url: json['avatar_url'],
      login: json['login'],
    );
  }
}
