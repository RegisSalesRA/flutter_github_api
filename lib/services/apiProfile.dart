// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Profile> fetchProfile() async {
  final response =
      await http.get(Uri.parse('https://api.github.com/users/RegisSalesRA'));

  if (response.statusCode == 200) {
    return Profile.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Profile');
  }
}

class Profile {
  final String login;
  final String avatar_url;
  final String bio;
  const Profile(
      {required this.login, required this.avatar_url, required this.bio});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        avatar_url: json['avatar_url'], login: json['login'], bio: json['bio']);
  }
}
