import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'qr_code_event.dart';
part 'qr_code_state.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  QrCodeBloc() : super(QrCodeInitial()) {
    on<InitializeBluetoothDevices>(
      (event, emit) async {},
    );
  }
}
