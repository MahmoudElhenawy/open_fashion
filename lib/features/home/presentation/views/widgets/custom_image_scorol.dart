import 'package:amimooo/features/home/presentation/manger/image_product_cubit/image_cubit.dart';
import 'package:amimooo/features/home/presentation/manger/image_product_cubit/image_state.dart';
import 'package:amimooo/features/home/presentation/views/widgets/custom_imag_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomImageScorol extends StatelessWidget {
  const CustomImageScorol({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductSuccess) {
          return CustomImageListView(products: state.products);
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
