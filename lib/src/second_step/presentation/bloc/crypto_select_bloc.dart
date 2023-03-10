import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'crypto_select_event.dart';
part 'crypto_select_state.dart';

class CryptoSelectBloc extends Bloc<CryptoSelectEvent, CryptoSelectState> {
  String selectedCryptoCurrency = '';
  CryptoSelectBloc() : super(CryptoSelectInitial()) {
    on<SelectCryptoCurrencyEvent>(
      (event, emit) {
        selectedCryptoCurrency = event.cryptoCurrency;
        emit(
          CryptoSelectedState(
            cryptoCurrency: event.cryptoCurrency,
          ),
        );
      },
    );
  }
}
