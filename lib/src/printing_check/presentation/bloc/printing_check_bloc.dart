import 'package:bloc/bloc.dart';
import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:meta/meta.dart';

part 'printing_check_event.dart';
part 'printing_check_state.dart';

class PrintingCheckBloc extends Bloc<PrintingCheckEvent, PrintingCheckState> {
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
  List<BluetoothDevice> devices = [];
  String devicesMessage = '';

  Future<void> printCheck(BluetoothDevice device) async {
    if (device.name != null && device.address != null) {
      await bluetoothPrint.connect(device);
      Map<String, dynamic> config = Map();
      List<LineText> lines = [];
      lines.add(
        LineText(
          content: 'Hello World',
          align: LineText.ALIGN_CENTER,
          width: 2,
          height: 2,
        ),
      );
      config['lines'] = lines;

      print(
        bluetoothPrint.printReceipt(
          config,
          lines,
        ),
      );
    }
  }

  PrintingCheckBloc() : super(PrintingCheckInitial()) {
    on<FindPrinterEvent>(
      (event, emit) {
        emit(
          InitializeBluetoothDevice(),
        );
        bluetoothPrint.startScan(
          timeout: Duration(seconds: 4),
        );
        emit(
          PrinterFound(),
        );
      },
    );
    on<PrintCheckEvent>(
      (event, emit) async {
        await printCheck(event.device);
      },
    );
  }
}
