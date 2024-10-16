import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:unicode_test_app/features/screens/product/repository/product_repository.dart';
import 'package:unicode_test_app/features/screens/product/repository/product_repository_impl.dart';

import '../models/product_response.dart';

part 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepositoryImpl) : super(const ProductState());
  ProductRepositoryImpl productRepositoryImpl;

  getProducts() async {
    var response = await productRepositoryImpl.getProducts();
    response.fold((failure) {}, (data) {
      emit(state.copyWith(products: data));
    });
  }
}
