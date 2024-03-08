
part of 'dialog_bloc.dart';


@immutable
sealed class DialogState {
  const DialogState();
}

@immutable
class DialogInitialState extends DialogState {}

@immutable
class CanNavigateState extends DialogState{}

@immutable
class CannotNavigateState extends DialogState{
  final String message;
  const CannotNavigateState({required this.message,});
}
