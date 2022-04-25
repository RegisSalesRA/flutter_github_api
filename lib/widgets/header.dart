import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/apiProfile.dart';
import '../services/apiStarred.dart';
import '../styles/colors.dart';
import '../styles/text.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  late Future<Profile> futureProfile;

  @override
  void initState() {
    super.initState();
    futureProfile = fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Profile>(
        future: futureProfile,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    child: ClipOval(
                      child: Image.network(snapshot.data!.avatar_url),
                    ),
                    radius: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data!.login,
                        style: TextStyle(
                            fontSize: CustomText.bold,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        snapshot.data!.bio,
                        style: TextStyle(
                            fontSize: CustomText.regular,
                            color: CustomColors.warmGrey),
                      )
                    ],
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
