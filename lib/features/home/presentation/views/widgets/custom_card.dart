import 'package:amimooo/core/utils/app_routers.dart';
import 'package:amimooo/features/home/presentation/manger/card_product_cubit/product_cubit.dart';
import 'package:amimooo/features/home/presentation/manger/card_product_cubit/product_state.dart';
import 'package:amimooo/features/home/presentation/views/widgets/custom_card_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductSuccess) {
          return CustomCardListView(
            products: state.products,
            onTap: (product) {
              GoRouter.of(context).push(
                AppRouters.detilesView,
                extra: product,
              );
            },
          );
        } else if (state is ProductFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
