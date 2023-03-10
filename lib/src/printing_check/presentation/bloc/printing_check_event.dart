part of 'printing_check_bloc.dart';

@immutable
abstract class PrintingCheckEvent {}
class FindPrinterEvent extends PrintingCheckEvent {}
class PrintCheckEvent extends PrintingCheckEvent {
  final BluetoothDevice device;
  PrintCheckEvent({
    required this.device,
  });
}