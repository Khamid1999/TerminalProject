import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'second_step_event.dart';
part 'second_step_state.dart';

class SecondStepBloc extends Bloc<SecondStepEvent, SecondStepState> {
  SecondStepBloc() : super(SecondStepInitial()) {
    on<SecondStepEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
