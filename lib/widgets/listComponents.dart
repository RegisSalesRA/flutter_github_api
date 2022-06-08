// ignore_for_file: file_names, avoid_print, must_be_immutable

import 'package:adagri/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../styles/colors.dart';

class ListComponent extends StatefulWidget {
  List<dynamic> repositorios;
  Widget search;
  ListComponent({Key? key, required this.repositorios, required this.search})
      : super(key: key);

  @override
  State<ListComponent> createState() => _ListComponentState();
}

class _ListComponentState extends State<ListComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            widget.search,
            Expanded(
                child: ListView.builder(
              itemCount: widget.repositorios.length,
              itemBuilder: (ctx, i) {
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.repositorios[i].name.toString(),
                              style: const TextStyle(
                                  fontSize: CustomText.bold,
                                  color: Colors.blue),
                            ),
                            Text(
                              widget.repositorios[i].description != null
                                  ? widget.repositorios[i].description
                                      .toString()
                                  : "Nenhuma descrição",
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: CustomText.regular,
                                  color: CustomColors.slateGrey),
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.code,
                                      color: CustomColors.slateGreyTwo,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                        widget.repositorios[i].language != null
                                            ? widget.repositorios[i].language
                                                .toString()
                                            : "Nenhuma linguagem",
                                        style: const TextStyle(
                                            color: CustomColors.slateGrey)),
                                  ],
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Row(
                                  children: const [
                                    FaIcon(
                                      FontAwesomeIcons.codeBranch,
                                      size: 20,
                                      color: CustomColors.slateGreyTwo,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("20",
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: CustomColors.slateGrey)),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                    ),
                    const Divider(
                      color: CustomColors.slateGreyTwo,
                      height: 20,
                      thickness: 0.5,
                      indent: 0,
                      endIndent: 0,
                    ),
                  ],
                );
              },
            ))
          ],
        ));
  }
}
