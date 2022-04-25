import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/apiProfile.dart';
import '../styles/colors.dart';
import '../styles/text.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            child: ClipOval(
              child: Image.network(
                'https://avatars.githubusercontent.com/u/48102820?v=4',
              ),
            ),
            radius: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "dawd",
                style: TextStyle(
                    fontSize: CustomText.bold, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Front end Dev and UI Designer",
                style: TextStyle(
                    fontSize: CustomText.regular, color: CustomColors.warmGrey),
              )
            ],
          )
        ],
      ),
    );
  }
}
