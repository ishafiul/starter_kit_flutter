part of 'snack_bar_cubit.dart';

@immutable
abstract class SnackBarState {}

class SnackBarInitial extends SnackBarState {}
class SnackBarLoaded extends SnackBarState {
  final Function? onPressed;
  final SnackBarType type;
  final String message;
  SnackBarLoaded({this.onPressed, required this.type, required this.message});
}
