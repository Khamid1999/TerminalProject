import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'first_step_event.dart';
part 'first_step_state.dart';

class FirstStepBloc extends Bloc<FirstStepEvent, FirstStepState> {
  TextEditingController numberController = TextEditingController();
  FirstStepBloc() : super(FirstStepInitial()) {
    on<FirstStepEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
