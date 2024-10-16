import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:unicode_test_app/data/network/api_failure.dart';
import 'package:unicode_test_app/features/screens/product/repository/product_repository.dart';

import '../../../../data/network/api_client.dart';
import '../../../../data/network/api_exception.dart';
import '../models/product_response.dart';
@injectable
class ProductRepositoryImpl implements ProductRepository {
  final ApiClient apiClient;

  ProductRepositoryImpl({required this.apiClient});

  @override
  Future<Either<ApiFailure, dynamic>> getProducts() async {
    try {
      final response = await apiClient.request(
          url: "https://fakestoreapi.com/products", method: Method.get);
      var productRes = parseProducts(response);
      return Right(productRes);
    } catch (error, stackTrace) {
      log('$stackTrace');
      return Left(ApiException.handle(error).failure);
    }
  }
}
