import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:unicode_test_app/core/app/flavors.dart';
import 'package:unicode_test_app/features/screens/product/cubit/product_cubit.dart';

import 'cart_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return state.products == null
            ? const CircularProgressIndicator(
                color: Colors.amber,
                backgroundColor: Colors.white,
              )
            : Scaffold(
                appBar: AppBar(
                  title: const Text(
                    'Persistent Shopping Cart',
                    style: TextStyle(fontSize: 15),
                  ),
                  centerTitle: true,
                  actions: [
                    PersistentShoppingCart().showCartItemCountWidget(
                      cartItemCountWidgetBuilder: (itemCount) => IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartView()),
                          );
                        },
                        icon: Badge(
                          label: Text(itemCount.toString()),
                          child: const Icon(Icons.shopping_bag_outlined),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0)
                  ],
                ),
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView.builder(
                        itemCount: state.products?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Image.network(
                                          state.products?[index].image ?? "",
                                          height: 100,
                                          width: 100,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state.products?[index].title ??
                                                    "",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                state.products?[index]
                                                        .description ??
                                                    "",
                                                maxLines: 2,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "TK${state.products?[index].price ?? 0}",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: PersistentShoppingCart()
                                                    .showAndUpdateCartItemWidget(
                                                  inCartWidget: Container(
                                                    height: 30,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: Border.all(
                                                          color: Colors.red),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Remove',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall,
                                                      ),
                                                    ),
                                                  ),
                                                  notInCartWidget: Container(
                                                    height: 30,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 5),
                                                      child: Center(
                                                        child: Text(
                                                          'Add to cart',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  product:
                                                      PersistentShoppingCartItem(
                                                          productId: index
                                                              .toString(),
                                                          productName: state
                                                                  .products?[
                                                                      index]
                                                                  .title ??
                                                              "",
                                                          productDescription:
                                                              state
                                                                  .products?[
                                                                      index]
                                                                  .description,
                                                          unitPrice:
                                                              double.parse(state
                                                                  .products![
                                                                      index]
                                                                  .price
                                                                  .toString()),
                                                          productThumbnail:
                                                              state
                                                                  .products?[
                                                                      index]
                                                                  .image
                                                                  .toString(),
                                                          quantity: 2),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              );
      },
    );
  }
}
