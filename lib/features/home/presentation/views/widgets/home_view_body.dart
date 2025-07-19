import 'package:amimooo/core/utils/styles.dart';
import 'package:amimooo/features/home/presentation/views/widgets/custom_card.dart';
import 'package:amimooo/features/home/presentation/views/widgets/custom_image_scorol.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        const SizedBox(height: 30),
        SizedBox(
          height: 200,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 0,
                right: 0,
                child: SvgPicture.asset('assets/svg/10.svg'),
              ),
              Positioned(
                top: 110,
                left: 0,
                right: 0,
                child: SvgPicture.asset('assets/svg/Collection.svg'),
              ),
              Positioned(
                top: 60,
                left: 0,
                right: 0,
                child: SvgPicture.asset('assets/svg/October.svg'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Image.asset('assets/images/cover1.png'),
        const SizedBox(height: 20),
        const CustomCard(),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            'You may also like',
            style: Styles.textStyle20.copyWith(
              color: Colors.white,
              fontFamily: 'Otama.ep',
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        CustomImageScorol(),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
