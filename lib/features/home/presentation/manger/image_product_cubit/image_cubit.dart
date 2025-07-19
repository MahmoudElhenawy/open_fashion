import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amimooo/features/home/presentation/manger/image_product_cubit/image_state.dart';
import 'package:amimooo/features/home/data/repos/home_repo.dart';

class ImageCubit extends Cubit<ImageState> {
  final HomeRepo homeRepo;

  ImageCubit(this.homeRepo) : super(ProductInitial());

  Future<void> fetchImageProducts() async {
    emit(ProductLoading());

    var result = await homeRepo.fetchImageProducts();

    result.fold(
      (failure) => emit(ProductFailure(failure.errMessage)),
      (products) => emit(ProductSuccess(products)),
    );
  }
}
