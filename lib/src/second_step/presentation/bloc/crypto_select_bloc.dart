import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'crypto_select_event.dart';
part 'crypto_select_state.dart';

class CryptoSelectBloc extends Bloc<CryptoSelectEvent, CryptoSelectState> {
  bool bitCoinSelected = false;
  bool ethereumSelected = false;
  bool litecoinSelected = false;
  bool rippleSelected = false;
  bool binanceCoinSelected = false;
  bool dashCoinSelected = false;
  bool dogeCoinSelected = false;
  bool usdtCoinSelected = false;
  CryptoSelectBloc() : super(CryptoSelectInitial()) {
    on<SelectCryptoCurrencyEvent>((event, emit) {});
  }
}
