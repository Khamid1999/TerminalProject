import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PrintPage extends StatefulWidget {
  final List<Map<String, dynamic>>? data;
  PrintPage({this.data});

  @override
  _PrintPageState createState() => _PrintPageState();
}

class _PrintPageState extends State<PrintPage> {
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
  List<BluetoothDevice> _devices = [];
  String _devicesMsg = "";
  final f = NumberFormat("\$###,###.00", "en_US");

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {initPrinter()});
  }

  Future<void> initPrinter() async {
    bluetoothPrint.startScan(timeout: Duration(seconds: 2));

    if (!mounted) return;
    bluetoothPrint.scanResults.listen(
      (val) {
        if (!mounted) return;
        setState(() => {_devices = val});
        if (_devices.isEmpty)
          setState(() {
            _devicesMsg = "No Devices";
          });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          initPrinter();
        },
        child: Icon(Icons.close),
      ),
      appBar: AppBar(
        title: Text('Select Printer'),
        backgroundColor: Colors.redAccent,
      ),
      body: _devices.isEmpty
          ? Center(
              child: Text(_devicesMsg ?? ''),
            )
          : ListView.builder(
              itemCount: _devices.length,
              itemBuilder: (c, i) {
                return ListTile(
                  leading: Icon(Icons.print),
                  title: Text(_devices[i].name ?? 'device-name'),
                  subtitle: Text(_devices[i].address ?? 'device-address'),
                  onTap: () {},
                );
              },
            ),
    );
  }
}
