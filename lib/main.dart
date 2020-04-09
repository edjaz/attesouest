import 'dart:convert';

import 'package:attestation/model/settings.dart';
import 'package:attestation/traduction.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/mon_attestation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  AppSettings settings = AppSettings.defaultObj();
  SharedPreferences sharedPreferences;

  Future<AppSettings> loadSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var settingsSaved = prefs.getString("settings");

    if (settingsSaved != null) {
      return AppSettings.fromJson(jsonDecode(settingsSaved));
    } else {
      return settings;
    }
  }

  @override
  void initState() {
    super.initState();
    loadSharedPreferences().then((v) {
      setState(() {
        settings = v;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon Attestation',
      theme: buildThemeData(),
      home: MonAttestation(
        title: TRADUCTIONS.APP_TITLE,
        settings: settings,
      ),
    );
  }

  ThemeData buildThemeData() => ThemeData(
        primarySwatch: Colors.blue,
      );
}
