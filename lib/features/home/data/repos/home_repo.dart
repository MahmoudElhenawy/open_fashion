import 'package:amimooo/core/errors/failuers.dart';
import 'package:amimooo/features/home/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> fetchNewsetproduct();
  Future<Either<Failure, List<ProductModel>>> fetchImageProducts();
}
