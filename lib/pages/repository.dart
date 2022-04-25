
import 'package:adagri/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../styles/colors.dart';

class Repository extends StatefulWidget {
  Repository({Key? key, required this.repositorios}) : super(key: key);
  List<dynamic> repositorios;
  @override
  State<Repository> createState() => _RepositoryState();
}

class _RepositoryState extends State<Repository> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(22),
              child: TextField(
                  style: const TextStyle(color: CustomColors.slateGreyTwo),
                  onChanged: (val) {
                    // ignore: avoid_print
                    print("Valor");
                  },
                  decoration: InputDecoration(
                    hintStyle:
                        const TextStyle(color: CustomColors.slateGreyTwo),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: CustomColors.slateGreyTwo)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        borderSide:
                            const BorderSide(color: CustomColors.slateGreyTwo)),
                    hintText: 'Filter by name',
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 30.0,
                    ),
                  )),
            ),
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
                              widget.repositorios[i].description.toString(),
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
                                    Text(widget.repositorios[i].language.toString(),
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
