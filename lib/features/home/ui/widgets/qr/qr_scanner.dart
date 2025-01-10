import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'package:todo_app/features/home/logic/home_cubit.dart';
import 'package:todo_app/features/home/ui/widgets/qr/qr_scanner_bloc_listener.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QrScannerState createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  QRCodeDartScanController controller = QRCodeDartScanController();
  bool isScanCompleted = false;
  String? qrResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qr Scan'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              width: 400.w,
              height: 300.h,
              child: QRCodeDartScanView(
                controller: controller,
                scanInvertedQRCode: true,
                typeScan: TypeScan.live,
                onCapture: (Result result) {
                  if (!isScanCompleted) {
                    setState(() {
                      isScanCompleted = true;
                    });
                    qrResult = result.toString();
                    context
                        .read<HomeCubit>()
                        .getSpecificTask(result.toString());
                    print(result.toString());
                    Future.delayed(const Duration(seconds: 4), () {
                      setState(() {
                        isScanCompleted = false;
                      });
                    });
                  }
                },
              ),
            ),
          ),
          QrScannerBlocListener(
            taskId: qrResult,
          )
        ],
      ),
    );
  }
}
