import 'package:amimooo/features/home/data/models/product_model.dart';

abstract class ImageState {}

class ProductInitial extends ImageState {}

class ProductLoading extends ImageState {}

class ProductSuccess extends ImageState {
  final List<ProductModel> products;

  ProductSuccess(this.products);
}

class ProductFailure extends ImageState {
  final String errorMessage;

  ProductFailure(this.errorMessage);
}
