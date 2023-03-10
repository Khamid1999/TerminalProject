part of 'crypto_select_bloc.dart';

@immutable
abstract class CryptoSelectState {}

class CryptoSelectInitial extends CryptoSelectState {}
class CryptoSelectedState extends CryptoSelectState{
  final String cryptoCurrency;
  CryptoSelectedState({
    required this.cryptoCurrency,
  });
}
