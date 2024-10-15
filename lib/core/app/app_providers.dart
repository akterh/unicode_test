
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/screens/theme/theme_cubit.dart';
import 'app_dependency.dart';

class AppProviders {
  static final providers = <BlocProvider>[
    BlocProvider<ThemeCubit>(
        create: (BuildContext context) => instance<ThemeCubit>()),
    // BlocProvider<InternetCubit>(
    //     create: (BuildContext context) => instance<InternetCubit>()),
    // BlocProvider<LoginCubit>(
    //     create: (BuildContext context) => instance<LoginCubit>()),
    // BlocProvider<HomeCubit>(
    //     create: (BuildContext context) => instance<HomeCubit>()),
  ];
}
