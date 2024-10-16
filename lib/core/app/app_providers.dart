
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicode_test_app/features/screens/product/cubit/product_cubit.dart';

import '../../features/screens/theme/theme_cubit.dart';
import 'app_dependency.dart';

class AppProviders {
  static final providers = <BlocProvider>[
    BlocProvider<ThemeCubit>(
        create: (BuildContext context) => instance<ThemeCubit>()),
    BlocProvider<ProductCubit>(
        create: (BuildContext context) => instance<ProductCubit>()),
    // BlocProvider<LoginCubit>(
    //     create: (BuildContext context) => instance<LoginCubit>()),
    // BlocProvider<HomeCubit>(
    //     create: (BuildContext context) => instance<HomeCubit>()),
  ];
}
