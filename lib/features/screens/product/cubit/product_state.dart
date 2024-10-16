part of 'product_cubit.dart';

class ProductState extends Equatable {
  const ProductState({this.products, this.cartProducts});

  final List<Product>? products;
  final List<Product>? cartProducts;

  ProductState copyWith(
      {List<Product>? products, List<Product>? cartProducts}) {
    return ProductState(
        products: products ?? this.products,
        cartProducts: cartProducts ?? this.cartProducts);
  }

  @override
  List<Object> get props => [products ?? [], cartProducts ?? []];
}
