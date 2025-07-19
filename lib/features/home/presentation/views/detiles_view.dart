import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/product_model.dart';
import 'widgets/detiles_view_body.dart';

class DetilesView extends StatelessWidget {
  const DetilesView({super.key, required ProductModel product});

  @override
  Widget build(BuildContext context) {
    final extra = GoRouter.of(context).state.extra;
    if (extra is! ProductModel) {
      return Scaffold(
        body: Center(
          child: Text("Invalid product data"),
        ),
      );
    }

    return Scaffold(
      body: DetilesViewBody(product: extra),
    );
  }
}
