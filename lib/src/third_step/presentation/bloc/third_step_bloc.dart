import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'third_step_event.dart';
part 'third_step_state.dart';

class ThirdStepBloc extends Bloc<ThirdStepEvent, ThirdStepState> {
  ThirdStepBloc() : super(ThirdStepInitial()) {
    on<ThirdStepEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
