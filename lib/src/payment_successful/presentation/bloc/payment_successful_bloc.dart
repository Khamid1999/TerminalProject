import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'payment_successful_event.dart';
part 'payment_successful_state.dart';

class PaymentSuccessfulBloc
    extends Bloc<PaymentSuccessfulEvent, PaymentSuccessfulState> {
  PaymentSuccessfulBloc() : super(PaymentSuccessfulInitial()) {
    on<PaymentSuccessfulEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
