import 'package:amimooo/core/errors/failuers.dart';
import 'package:amimooo/core/utils/api_services.dart';
import 'package:amimooo/features/home/data/models/product_model.dart';
import 'package:amimooo/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<ProductModel>>> fetchNewsetproduct() async {
    try {
      var data = await apiService.get(
        endpoint: 'products',
      );

      // هنا الـ API بيرجع List مباشرة
      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return right(products);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> fetchImageProducts() async {
    try {
      var data = await apiService.get(
        endpoint: 'products',
      );

      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return right(products);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
