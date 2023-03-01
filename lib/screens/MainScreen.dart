import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void scanDevices() {
    print('scanDevices');
    FlutterBlue.instance.state.toList().then((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bluetooth Yazıcı"),
        actions: [
          GestureDetector(
            onTap: () {
              scanDevices();
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
