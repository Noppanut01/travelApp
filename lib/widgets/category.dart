import 'package:flutter/material.dart';
import 'package:mytravel/constants/colors.dart';

class CategoryIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  // final Color color;
  const CategoryIcon({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 30,
            color: primaryColor,
          ),
        ),
        Text(title),
      ],
    );
  }
}
