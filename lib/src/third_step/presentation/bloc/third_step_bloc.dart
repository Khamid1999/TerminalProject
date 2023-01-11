import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'third_step_event.dart';
part 'third_step_state.dart';

class ThirdStepBloc extends Bloc<ThirdStepEvent, ThirdStepState> {
  TextEditingController moneyAmountController = TextEditingController();
  TextEditingController cryptoAmountController = TextEditingController();
  ThirdStepBloc() : super(ThirdStepInitial()) {
    on<ThirdStepEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
