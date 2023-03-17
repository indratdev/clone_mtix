import 'package:flutter/material.dart';

class SearchMovieTextfieldWidget extends StatefulWidget {
  const SearchMovieTextfieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchMovieTextfieldWidget> createState() =>
      _SearchMovieTextfieldWidgetState();
}

class _SearchMovieTextfieldWidgetState
    extends State<SearchMovieTextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        print("nilai : $value");
      },
      decoration: InputDecoration(
          hintText: "Type a movie to search",
          contentPadding: EdgeInsets.symmetric(horizontal: 20)),
    );
  }
}
