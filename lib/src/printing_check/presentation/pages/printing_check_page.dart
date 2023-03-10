import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_project/src/printing_check/presentation/bloc/printing_check_bloc.dart';
import 'package:terminal_project/src/theme/app_colors.dart';
import 'package:terminal_project/src/theme/app_styles.dart';

class PrintingCheckPage extends StatelessWidget {
  const PrintingCheckPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PrintingCheckBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.dark,
          ),
        ),
        title: Text(
          'devices'.tr(),
          style: AppStyles.mainBlackTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<PrintingCheckBloc, PrintingCheckState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is InitializeBluetoothDevice)
            return Center(
              child: CircularProgressIndicator(),
            );
          if (state is PrinterFound)
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: StreamBuilder<List<BluetoothDevice>>(
                stream: bloc.bluetoothPrint.scanResults,
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final device = snapshot.data![index];
                      if (snapshot.data == null) {
                        return Center(
                          child: Text(
                            'No devices'.tr(),
                            style: AppStyles.mainBlackTextStyle,
                          ),
                        );
                      }
                      return GestureDetector(
                        onTap: () {
                          context.read<PrintingCheckBloc>().add(
                            PrintCheckEvent(
                              device: device,
                            ),
                          );
                        },
                        child: ListTile(
                          leading: Icon(Icons.print),
                          title: Text(
                            snapshot.data![index].name ?? 'device-name',
                            style: AppStyles.mainBlackTextStyle,
                          ),
                          subtitle: Text(
                            snapshot.data![index].address ?? 'device-address',
                            style: AppStyles.mainBlackTextStyle,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          return Container();
        },
      ),
    );
  }
}
