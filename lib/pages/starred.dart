import 'package:flutter/material.dart';

import '../services/apiStarred.dart';

class Starred extends StatefulWidget {
  Starred({Key? key}) : super(key: key);

  @override
  State<Starred> createState() => _StarredState();
}

class _StarredState extends State<Starred> {
  late Future<Profile> futureProfile;

  @override
  void initState() {
    super.initState();
    futureProfile = fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Text("Alow");
  }
}
 