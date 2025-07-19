import 'package:amimooo/features/home/presentation/manger/card_product_cubit/product_state.dart';
import 'package:bloc/bloc.dart';

import 'package:amimooo/features/home/data/repos/home_repo.dart';

class ProductCubit extends Cubit<ProductState> {
  final HomeRepo homeRepo;

  ProductCubit(this.homeRepo) : super(ProductInitial());

  Future<void> fetchProducts() async {
    emit(ProductLoading());

    var result = await homeRepo.fetchNewsetproduct();

    result.fold(
      (failure) {
        emit(ProductFailure(failure.errMessage));
      },
      (products) {
        emit(ProductSuccess(products));
      },
    );
  }
}
