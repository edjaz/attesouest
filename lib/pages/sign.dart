import 'dart:ui';

import 'package:attestation/model/settings.dart';
import 'package:attestation/styles.dart';
import 'package:flutter/material.dart';

class Sign extends CustomPainter {
  final AppSettings settings;

  Sign(this.settings);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.black;
    settings.sign.forEach((index, serie) {
      var points = serie.map((p) => Offset(p.x, p.y)).toList();
      canvas.drawPoints(PointMode.polygon, points, paint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class SignPage extends StatefulWidget {
  final AppSettings settings;

  const SignPage({Key key, this.settings}) : super(key: key);

  @override
  SignPageState createState() {
    return SignPageState();
  }
}

class SignPageState extends State<SignPage> {
  int index = 0;

  Future<DateTime> selectedDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
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
          'Ma signature',
          style: TextStyle(color: AppColor.textColorLight),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.close),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: widget.settings.doInCity,
                  onChanged: (String value) {
                    setState(() {
                      widget.settings.doInCity = value;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Fait à'),
                ),
                MouseRegion(
                  child: Container(
                    constraints:
                    const BoxConstraints(minWidth: double.infinity),
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                          left: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                          right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                          bottom:
                          BorderSide(width: 1.0, color: Color(0xFFFF000000)),
                        )),
                    child: Listener(
                      onPointerMove: (event) {
                        print("onPointerMove" + event.position.toString());
                        setState(() {
                          if (widget.settings.sign[index] == null) {
                            widget.settings.sign[index] = [];
                          }
                          widget.settings.sign[index].add(Point(
                              event.localPosition.dx, event.localPosition.dy));
                        });
                      },
                      onPointerUp: (event) {
                        setState(() {
                          index++;
                        });
                      },
                      child: CustomPaint(
                        painter: Sign(widget.settings),
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      index = 0;
                      widget.settings.sign = {};
                    });
                  },
                  child: Text('Effacer'),
                )
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
