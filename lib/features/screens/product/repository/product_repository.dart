import 'package:dartz/dartz.dart';

import '../../../../data/network/api_failure.dart';

abstract class ProductRepository{
  Future<Either<ApiFailure, dynamic>> getProducts();
}