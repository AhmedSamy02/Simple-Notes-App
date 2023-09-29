import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteBlocObserver implements BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    debugPrint('Created : ${bloc.toString()}');
    // TODO: implement onCreate

  }
  @override
  void onEvent(Bloc bloc, Object? event) {

    // TODO: implement onEvent
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError

  }

  @override
  void onChange(BlocBase bloc, Change change) {

    debugPrint('Change : ${change.toString()}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {

    // TODO: implement onChange
  }
  
  @override
  void onClose(BlocBase bloc) {
    debugPrint('Closed : ${bloc.toString()}');
    // TODO: implement onClose
  }
}
