import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:starter_kit_flutter/common/state/snack_bar/snack_bar_cubit.dart';

@Singleton()
class Provider {
  List<BlocProvider> providers = [
    BlocProvider<SnackBarCubit>(
      create: (BuildContext context) => SnackBarCubit(),
    ),
  ];
}
