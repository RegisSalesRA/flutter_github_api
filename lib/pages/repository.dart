import 'package:adagri/services/apiRepository.dart';
import 'package:adagri/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../styles/colors.dart';

class Repository extends StatefulWidget {
  Repository({Key? key}) : super(key: key);

  @override
  State<Repository> createState() => _RepositoryState();
}

class _RepositoryState extends State<Repository> {
  bool _init = true;
  bool _isLoading = true;
  @override
  void didChangeDependencies() async {
    if (_init) {
      _isLoading = await Provider.of<RepositoryState>(context).getRepos();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final repositorysList = Provider.of<RepositoryState>(context).repos;
    final casa = "Casa";
    final casa2 = "Casa 2";
    print(repositorysList);
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
              itemCount: repositorysList.length,
              itemBuilder: (ctx, i) {
                //print(repositorysList);
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              repositorysList[i].name.toString(),
                              style: TextStyle(
                                  fontSize: CustomText.bold,
                                  color: Colors.blue),
                            ),
                            Text(
                              "Descricao",
                              style: TextStyle(
                                  fontSize: CustomText.regular,
                                  color: CustomColors.slateGrey),
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.code,
                                      color: CustomColors.slateGreyTwo,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("Linguagem",
                                        style: TextStyle(
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
                                    Text("100",
                                        style: TextStyle(
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
