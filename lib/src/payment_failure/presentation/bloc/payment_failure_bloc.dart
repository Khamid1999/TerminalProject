import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'payment_failure_event.dart';
part 'payment_failure_state.dart';

class PaymentFailureBloc extends Bloc<PaymentFailureEvent, PaymentFailureState> {
  PaymentFailureBloc() : super(PaymentFailureInitial()) {
    on<PaymentFailureEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
