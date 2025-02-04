import 'package:flutter/material.dart';
import '../constants/colors.dart';

class InputSearch extends StatelessWidget {
  const InputSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        cursorColor: secondaryColor,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(color: secondaryColor),
          border: InputBorder.none,
          icon: Icon(
            Icons.search,
            color: secondaryColor,
          ),
        ),
      ),
    );
  }
}
