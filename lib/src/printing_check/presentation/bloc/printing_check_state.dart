part of 'printing_check_bloc.dart';

@immutable
abstract class PrintingCheckState {}

class PrintingCheckInitial extends PrintingCheckState {}

class InitializeBluetoothDevice extends PrintingCheckState {}

class PrinterFound extends PrintingCheckState {}

class PrinterNotFound extends PrintingCheckState {
  final String message;
  PrinterNotFound({
    required this.message,
  });
}
