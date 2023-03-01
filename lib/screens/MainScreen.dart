import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:permission_handler/permission_handler.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void checkBluetoothStatus() {
    FlutterBlue.instance.state.listen((state) {
      if (state == BluetoothState.off) {
        EasyLoading.showInfo("Lütfen bluetooth u açınız...");
      }
      if (state == BluetoothState.on) {
        scanDevices();
      }
    });
  }

  void scanDevices() async {
    var bluetoothConnectStatus =
        await Permission.bluetoothConnect.request().isGranted;
    var bluetoothScanStatus =
        await Permission.bluetoothScan.request().isGranted;

    if (bluetoothConnectStatus && bluetoothScanStatus) {
      EasyLoading.show(status: 'Cihazlar aranıyor...');
      var instance = FlutterBlue.instance;
      instance.startScan(timeout: const Duration(seconds: 15));
      var subscription = instance.scanResults.listen((results) {
        for (ScanResult r in results) {
          print(
              "${r.device.name} rssi: ${r.rssi} type: ${r.device.type.toString()}");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bluetooth Yazıcı"),
        actions: [
          GestureDetector(
            onTap: () {
              checkBluetoothStatus();
            },
            child: const Padding(
                padding: EdgeInsets.only(right: 15, top: 5),
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: 25,
                )),
          )
        ],
      ),
    );
  }
}
