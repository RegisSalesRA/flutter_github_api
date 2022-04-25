import 'package:adagri/services/apiRepository.dart';
import 'package:flutter/material.dart';
import 'package:adagri/pages/home.dart';
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
        title: 'Flutter Hive',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}
