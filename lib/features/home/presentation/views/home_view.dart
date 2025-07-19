import 'package:amimooo/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:amimooo/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: SafeArea(child: CustomHomeAppBar(color: Colors.white)),
      ),
      body: const HomeViewBody(),
    );
  }
}
