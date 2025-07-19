import 'package:amimooo/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(
            Icons.menu,
            color: color,
          ),
          const Spacer(),
          SvgPicture.asset(
            AssetsData.logo,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
          const Spacer(),
          Icon(
            Icons.search,
            color: color,
          ),
          const SizedBox(
            width: 5,
          ),
          Icon(
            Icons.shopping_bag,
            color: color,
          ),
        ],
      ),
    );
  }
}
