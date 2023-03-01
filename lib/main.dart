import 'package:egitimyazici/screens/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Burulas Yazici',
        debugShowCheckedModeBanner:
            false, //Sağ üst taraftaki debug etiketini kaldırır.
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        builder: EasyLoading.init(),
        initialRoute: "/",
        routes: {"/": ((context) => const MainScreen())});
  }
}
