import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_aes_ecb_pkcs5_fork/flutter_aes_ecb_pkcs5_fork.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String pkcs5Progress;

    //string format
    var data = "{\"username\":\"helloword\"}";

    //create 16 byte random key
    var key = await FlutterAesEcbPkcs5.generateDesKey(128);

    //encrypt
    var encryptText = await FlutterAesEcbPkcs5.encryptString(data, key);

    //decrypt
    var decryptText = await FlutterAesEcbPkcs5.decryptString(encryptText, key);

    pkcs5Progress = "data:" +
        data +
        "\n" +
        "create key:" +
        key +
        "\n" +
        "encryptText :" +
        encryptText +
        "\n" +
        "decryptText :" +
        decryptText +
        "\n";

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = pkcs5Progress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter_aes_ecb_pkcs5'),
        ),
        body: Center(
          child: Text('pkcs5Progress:\n $_platformVersion\n'),
        ),
      ),
    );
  }
}
