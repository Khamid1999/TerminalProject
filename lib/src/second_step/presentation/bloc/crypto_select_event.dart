part of 'crypto_select_bloc.dart';

@immutable
abstract class CryptoSelectEvent {}
class SelectCryptoCurrencyEvent extends CryptoSelectEvent {
  final String cryptoCurrency;
  SelectCryptoCurrencyEvent({
    required this.cryptoCurrency,
  });
}
