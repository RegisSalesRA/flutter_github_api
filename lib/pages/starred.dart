import 'package:flutter/material.dart';

import '../services/apiStarred.dart';

class Starred extends StatefulWidget {
  Starred({Key? key}) : super(key: key);

  @override
  State<Starred> createState() => _StarredState();
}

class _StarredState extends State<Starred> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Text("Alow");
  }
}


// Center(
//       child: FutureBuilder<Album>(
//         future: futureAlbum,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Container(
//               child: Column(children: [
//                 // Image.network(snapshot.data!.avatar_url),
//                 Text(snapshot.data!.login)
//               ]),
//             );
//           } else if (snapshot.hasError) {
//             return Text('${snapshot.error}');
//           }
//           return const CircularProgressIndicator();
//         },
//       ),
//     );