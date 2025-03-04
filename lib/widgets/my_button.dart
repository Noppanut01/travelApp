import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Function()? onTab;
  const MyButton({
    required this.title,
    required this.onTab,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.kanit(
            textStyle: Theme.of(context).textTheme.bodyLarge,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}
