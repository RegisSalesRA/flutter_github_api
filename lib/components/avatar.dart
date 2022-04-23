import 'package:flutter/material.dart';

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
            maxRadius: 40,
            backgroundColor: Colors.brown.shade800,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Roger Ramos",
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
