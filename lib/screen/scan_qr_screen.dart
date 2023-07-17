import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:timesheet/controller/scan_qr_controller.dart';
import 'package:timesheet/data/model/body/model_ccdc/ccdc.dart';
import 'package:timesheet/helper/route_helper.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<StatefulWidget> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  var argument = Get.arguments;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  FToast fToast = FToast();

  @override
  void initState() {
    super.initState();
    print(argument);
    fToast.init(context);
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: (argument.toString() == "Inventory")
                      ? _onQRViewCreated
                      : openBottomSheet,
                  overlay: QrScannerOverlayShape(
                    borderRadius: 16,
                    borderColor: Colors.white,
                    borderLength: 24,
                    borderWidth: 8,
                    cutOutSize: 300,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: const EdgeInsets.only(top: 30),
                child: const Text(
                  "Quét mã QR",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Positioned(
              child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(18.0),
              child: Icon(
                Icons.cancel_outlined,
                color: Colors.grey,
                size: 32,
              ),
            ),
          )),
          GetBuilder<QrController>(
              builder: (controller) => Visibility(
                    visible: controller.loading &&
                        (argument.toString() == "Inventory"),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                  ))
        ],
      ),
    ));
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!Get.find<QrController>().scanSuccess) {
        Get.find<QrController>().resetStatus();
        var data = scanData.code;
        CCDC ccdc = CCDC(
            timestamp: data?.substring(7, 18),
            message: data?.substring(19, 30),
            apiSubErrors: data?.substring(30, 36));
        Get.find<QrController>().addItem(ccdc).then((value) => {
              if (value)
                {
                  controller.dispose(),
                  Timer(const Duration(seconds: 1), () {
                    Get.find<QrController>().resetStatus();
                    Navigator.pop(context);
                    showToast();
                  })
                }
            });
        // showModalBottomSheet(
        //   context: context,
        //   builder: (BuildContext context) =>  SizedBox(
        //     height: 200,
        //     child: Center(child: Text("Đã thêm sản phẩm thành công ${scanData.code}")),
        //   ),
        // ).then((value) => {Get.find<QrController>().resetStatus()});
      }
    });
  }

  void openBottomSheet(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      final code = scanData.code;
      if (code != null && code.isNotEmpty) {
        String qrCode = code.substring(7, 18);
        Get.offNamed(RouteHelper.getAccessInfo(qrCode));
        // Get.find<QrController>().getInfoAsset(qrCode);
      }
    });
  }

  Future<void> flipcam() async {
    await controller!.flipCamera();
  }

  Future<void> flash() async {
    await controller!.toggleFlash();
  }

  void showToast() {
    fToast.showToast(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.green,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
          child: Text(
            'Quét mã thành công',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(milliseconds: 1500),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    Get.find<QrController>().clearData();
    super.dispose();
  }
}
