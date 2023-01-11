part of 'crypto_select_bloc.dart';

@immutable
abstract class CryptoSelectEvent {}
class SelectCryptoCurrencyEvent extends CryptoSelectEvent {
  final String cryptoCurrency;
  final bool isSelected;
  SelectCryptoCurrencyEvent({
    required this.isSelected,
    required this.cryptoCurrency,
  });
}
