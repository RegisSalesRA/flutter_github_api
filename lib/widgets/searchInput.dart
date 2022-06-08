// ignore_for_file: file_names

import 'package:adagri/styles/colors.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final Function search;
  const SearchInput({Key? key, required this.search}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(22),
        child: TextField(
            style: const TextStyle(color: CustomColors.slateGreyTwo),
            onSubmitted: (val) {
              search(val);
            },
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: CustomColors.slateGreyTwo),
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
              fillColor: Colors.white,
              filled: true,
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: CustomColors.slateGreyTwo)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  borderSide:
                      const BorderSide(color: CustomColors.slateGreyTwo)),
              hintText: 'Filter by name',
              prefixIcon: const Icon(
                Icons.search,
                size: 30.0,
              ),
            )));
  }
}
