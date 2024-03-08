import 'dart:async';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories/services/push_notification_service.dart';
import 'package:stories/util/app_constants/menu_constants.dart';

part 'dialog_event.dart';
part 'dialog_state.dart';

class DialogBloc extends Bloc<DialogEvent, DialogState> {
  static const _errorMessage = 'Select atleast four categories';
  static const _noInternetMessage= 'No Internet Connection';
  static const _maxCount = 4, _initCount = 0;
  final PushNotificationService _pushNotificationService = PushNotificationService();
  DialogBloc() : super(DialogInitialState()) {
    on<NavigateEvent>(_handleNavigate);
  }

  bool get canNavigate {
    int count = 0;
    for (var i = _initCount; i < StoryCategories.categories.length; i++) {
      if (StoryCategories.categories.values.elementAt(i).isAllowed) {
        count++;
      }
    }
    return count >= _maxCount;
  }

  FutureOr<void> _handleNavigate(
      NavigateEvent event, Emitter<DialogState> emit) async{
        final connectivityResult = await Connectivity().checkConnectivity();
    if(connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
      if (canNavigate) {
      _setupTopicsForMessaging();
      emit(CanNavigateState());

    } else {      
      emit(
        CannotNavigateState(message: _errorMessage,),
      );
    }
    }else{
      emit(CannotNavigateState(message: _noInternetMessage),);
    }
  }

  _setupTopicsForMessaging(){
    for (var i = 0; i < StoryCategories.categories.length ; i++) {
      log('[Values : ${StoryCategories.categories.values.elementAt(i).value}]');
      _pushNotificationService.subscribeToTopics(StoryCategories.categories.values.elementAt(i).value);
    }
  }
}