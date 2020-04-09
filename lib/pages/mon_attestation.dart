import 'package:attestation/utils/date_utils.dart';
import 'package:attestation/model/settings.dart';
import 'package:attestation/pages/settings_page.dart';
import 'package:attestation/pages/sign.dart';
import 'package:attestation/traduction.dart';
import 'package:attestation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MonAttestation extends StatefulWidget {
  MonAttestation({Key key, this.title, this.settings}) : super(key: key);
  final String title;
  final AppSettings settings;

  @override
  _MonAttestationState createState() => _MonAttestationState();
}

class _MonAttestationState extends State<MonAttestation> {
  _MonAttestationState();

  void _showSettingsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsPage(
          settings: widget.settings,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Text(
                  TRADUCTIONS.PLACEMENT_DEROGATOIRE_TITLE,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  TRADUCTIONS.INTRO,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(FemaleUtils.toFemal(
                    widget.settings.civility, TRADUCTIONS.SIGN)),
              ),
              Text(fullName()),
              Text(FemaleUtils.toFemal(widget.settings.civility, 'Né') +
                  ' le  : ' +
                  DateUtils.dateToString(widget.settings.birthday)),
              Text(
                'À : ' + widget.settings.birthdayPlace,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Demeurant  : '),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.settings.address.line1),
                      Text(widget.settings.address.line2),
                      Text(widget.settings.address.zip +
                          ' ' +
                          widget.settings.address.city),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(TRADUCTIONS.CERTIFY),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
              ),
              Visibility(
                visible: widget.settings.options[Move.Pro],
                child: Row(
                  children: <Widget>[
                    Checkbox(value: widget.settings.options[Move.Pro]),
                    Expanded(
                      child: Text(TRADUCTIONS.MOVE[Move.Pro]),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: widget.settings.options[Move.Buy],
                child: Row(
                  children: <Widget>[
                    Checkbox(value: widget.settings.options[Move.Buy]),
                    Expanded(
                      child: Text(TRADUCTIONS.MOVE[Move.Buy]),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: widget.settings.options[Move.Health],
                child: Row(
                  children: <Widget>[
                    Checkbox(value: widget.settings.options[Move.Health]),
                    Expanded(
                      child: Text(TRADUCTIONS.MOVE[Move.Health]),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: widget.settings.options[Move.Family],
                child: Row(
                  children: <Widget>[
                    Checkbox(value: widget.settings.options[Move.Family]),
                    Expanded(
                      child: Text(TRADUCTIONS.MOVE[Move.Family]),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: widget.settings.options[Move.Activity],
                child: Row(
                  children: <Widget>[
                    Checkbox(value: widget.settings.options[Move.Activity]),
                    Expanded(
                      child: Text(TRADUCTIONS.MOVE[Move.Activity]),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: widget.settings.options[Move.Judiciaire],
                child: Row(
                  children: <Widget>[
                    Checkbox(value: widget.settings.options[Move.Judiciaire]),
                    Expanded(
                      child: Text(TRADUCTIONS.MOVE[Move.Judiciaire]),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: widget.settings.options[Move.InteretGeneral],
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        value: widget.settings.options[Move.InteretGeneral]),
                    Expanded(
                      child: Text(TRADUCTIONS.MOVE[Move.InteretGeneral]),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text('Fait à ' +
                    widget.settings.doInCity +
                    ', le ' +
                    DateUtils.dateTimeToString(widget.settings.started, 'à')),
              ),
              Container(
                constraints: BoxConstraints(minWidth: double.infinity),
                height: 100,
                child: CustomPaint(
                  painter: Sign(widget.settings),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 90, top: 20),
                child: QrImage(data: computeQrCode(), version: QrVersions.auto),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showSettingsPage,
        tooltip: 'Settings',
        child: Icon(Icons.settings),
      ),
    );
  }

  String fullName() {
    return TRADUCTIONS.CIVILITY[widget.settings.civility] +
        ' ' +
        widget.settings.lastname +
        ' ' +
        widget.settings.firstname;
  }

  computeQrCode() {
    return 'Cree le: ' +
        DateUtils.dateTimeToString(widget.settings.started, 'a') +
        '; ' +
        'Nom: ' +
        widget.settings.lastname +
        '; ' +
        'Prenom: ' +
        widget.settings.firstname +
        '; ' +
        'Naissance: ' +
        DateUtils.dateToString(widget.settings.birthday) +
        ' a ' +
        widget.settings.birthdayPlace +
        '; ' +
        'Adresse: ' +
        widget.settings.address.toString() +
        '; ' +
        'Sortie: ' +
        DateUtils.dateTimeToString(widget.settings.started, 'a') +
        '; ' +
        'Motifs: ' +
        motifs();
  }

  String motifs() {
    String res = '';
    widget.settings.options.forEach((key, v) {
      if (v) {
        if (res != '') res += '-';
        res = QR_TRADUCTIONS.MOVE[key];
      }
    });
    return res;
  }
}
