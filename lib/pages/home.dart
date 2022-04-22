import 'package:flutter/material.dart';
import '../styles/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.slateGreyTwo,
          title: Row(
            children: const [
              FaIcon(FontAwesomeIcons.github),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Github profiles"),
              )
            ],
          ),
        ),
        body: SafeArea(
            child: Container(
          color: CustomColors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
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
                        Text("Roger Ramos"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Front end Dev and UI Designer")
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
