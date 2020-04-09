import 'dart:convert';

import 'package:attestation/model/settings.dart';
import 'package:attestation/pages/sign.dart';
import 'package:attestation/styles.dart';
import 'package:attestation/traduction.dart';
import 'package:attestation/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  final AppSettings settings;

  const SettingsPage({Key key, this.settings}) : super(key: key);

  @override
  SettingsPageState createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  Future<DateTime> selectedDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: widget.settings.birthday,
      firstDate: DateTime(1950),
      lastDate: DateTime(2020),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );

    if (picked != null && picked != widget.settings.birthday) {
      setState(() {
        widget.settings.birthday = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Paramétrages',
          style: TextStyle(color: AppColor.textColorLight),
        ),
        leading: IconButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            var settings = JsonEncoder().convert(widget.settings);
            await prefs.setString("settings", settings);
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.close),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      widget.settings.started = DateTime.now();
                    });
                  },
                  child: Text('Démarrer la sortie'),
                ),
                TextFormField(
                  initialValue: widget.settings.firstname,
                  onChanged: (String value) {
                    setState(() {
                      widget.settings.firstname = value;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Prénom'),
                ),
                TextFormField(
                  initialValue: widget.settings.lastname,
                  onChanged: (String value) {
                    setState(() {
                      widget.settings.lastname = value;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Nom'),
                ),
                Row(
                  children: <Widget>[
                    Text('Date de naissance : '),
                    Text(DateUtils.dateToString(widget.settings.birthday)),
                    Container(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {
                          selectedDate(context);
                        },
                      ),
                    )
                  ],
                ),
                TextFormField(
                  initialValue: widget.settings.birthdayPlace,
                  onChanged: (String value) {
                    setState(() {
                      widget.settings.birthdayPlace = value;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Né(e) à'),
                ),
                TextFormField(
                  initialValue: widget.settings.address.line1,
                  onChanged: (String value) {
                    setState(() {
                      widget.settings.address.line1 = value;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Adresse'),
                ),
                TextFormField(
                  initialValue: widget.settings.address.line2,
                  onChanged: (String value) {
                    setState(() {
                      widget.settings.address.line2 = value;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Complément d \'adresse'),
                ),
                TextFormField(
                  initialValue: widget.settings.address.zip,
                  onChanged: (String value) {
                    setState(() {
                      widget.settings.address.zip = value;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Code postal'),
                ),
                TextFormField(
                  initialValue: widget.settings.address.city,
                  onChanged: (String value) {
                    setState(() {
                      widget.settings.address.city = value;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Ville'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                ),
                Text('Raison du déplacement :',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: widget.settings.options[Move.Pro],
                          onChanged: (bool value) {
                            setState(() {
                              widget.settings.options[Move.Pro] = value;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(TRADUCTIONS.MOVE[Move.Pro]),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                            value: widget.settings.options[Move.Buy],
                            onChanged: (bool value) {
                              setState(() {
                                widget.settings.options[Move.Buy] = value;
                              });
                            }),
                        Expanded(
                          child: Text(TRADUCTIONS.MOVE[Move.Buy]),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                            value: widget.settings.options[Move.Health],
                            onChanged: (bool value) {
                              setState(() {
                                widget.settings.options[Move.Health] = value;
                              });
                            }),
                        Expanded(
                          child: Text(TRADUCTIONS.MOVE[Move.Health]),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                            value: widget.settings.options[Move.Family],
                            onChanged: (bool value) {
                              setState(() {
                                widget.settings.options[Move.Family] = value;
                              });
                            }),
                        Expanded(
                          child: Text(TRADUCTIONS.MOVE[Move.Family]),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                            value: widget.settings.options[Move.Activity],
                            onChanged: (bool value) {
                              setState(() {
                                widget.settings.options[Move.Activity] = value;
                              });
                            }),
                        Expanded(
                          child: Text(TRADUCTIONS.MOVE[Move.Activity]),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                            value: widget.settings.options[Move.Judiciaire],
                            onChanged: (bool value) {
                              setState(() {
                                widget.settings.options[Move.Judiciaire] =
                                    value;
                              });
                            }),
                        Expanded(
                          child: Text(TRADUCTIONS.MOVE[Move.Judiciaire]),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                            value: widget.settings.options[Move.InteretGeneral],
                            onChanged: (bool value) {
                              setState(() {
                                widget.settings.options[Move.InteretGeneral] =
                                    value;
                              });
                            }),
                        Expanded(
                          child: Text(TRADUCTIONS.MOVE[Move.InteretGeneral]),
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                ),
                RaisedButton(
                  onPressed: _showSignaturePage,
                  child: Text('Signature'),
                ),
              ],
            )),
      ),
    );
  }

  void _showSignaturePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignPage(
          settings: widget.settings,
        ),
        fullscreenDialog: true,
      ),
    );
  }
}
