
import 'package:starter_kit_flutter/comon/widgets/snackbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'snack_bar_state.dart';

@Singleton()
class SnackBarCubit extends Cubit<SnackBarState> {
  SnackBarCubit() : super(SnackBarInitial());
  Future<void> snackBar({Function? onPressed,
    required SnackBarType type,
    required String message,}) async {
    emit(SnackBarLoaded(type: type, message: message,onPressed: onPressed));
    emit(SnackBarInitial());
  }
}
