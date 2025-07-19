import 'package:amimooo/constens.dart';
import 'package:amimooo/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.icon, required this.title});
  final Icon icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Icon(
          icon.icon,
          color: kpcolor,
          size: 20,
        ),
        Text(
          title,
          style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
