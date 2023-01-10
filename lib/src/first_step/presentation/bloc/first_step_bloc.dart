import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'first_step_event.dart';
part 'first_step_state.dart';

class FirstStepBloc extends Bloc<FirstStepEvent, FirstStepState> {
  FirstStepBloc() : super(FirstStepInitial()) {
    on<FirstStepEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
