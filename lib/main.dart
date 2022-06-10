import 'package:github/services/apiGithubData.dart';
import 'package:flutter/material.dart';
import 'package:github/pages/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => RepositoryState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Github Profile',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}
