part of 'dialog_bloc.dart';

@immutable
sealed class DialogEvent {
  const DialogEvent();
}

@immutable
class NavigateEvent extends DialogEvent {}
