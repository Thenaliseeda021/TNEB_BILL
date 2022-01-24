// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Unit extends StatefulWidget {
  const Unit({Key? key}) : super(key: key);

  @override
  _UnitState createState() => _UnitState();
}

class _UnitState extends State<Unit> {
  final _value = TextEditingController();
  bool _validate = false;
  var result = '0';

  @override
  void dispose() {
    _value.dispose();
    super.dispose();
  }

  void sum() {
    double unit = double.parse(_value.text);
    if (unit <= 100) {
      double b = 000;
      result = b.toString();
    } else if (unit >= 101 && unit <= 200) {
      double b = (unit - 100) * 1.5 + 20;
      result = b.toString();
    } else if (unit >= 201 && unit <= 500) {
      double b = (unit - 200);
      if (b <= 300) {
        double c = 200 + (b * 3) + 30;
        result = c.toString();
      }
    } else if (unit >= 501) {
      double b = (unit - 500);
      if (b >= 1) {
        double c = 1730 + (b * 6.6) + 50;
        result = c.toString();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          SizedBox(),
          Padding(
            padding: EdgeInsets.only(top: 75, left: 75, right: 75),
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: _value,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () => _value.clear(),
                    icon: Icon(Icons.clear),
                  ),
                  hintText: 'Enter unit ',
                  errorText: _validate ? 'Enter Some Units' : null,
                  border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            ' \t ₹ ' + result,
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.w500),
                          ),
                        );
                      });
                  setState(() {
                    _value.text.isEmpty ? _validate = true : _validate = false;
                    sum();
                  });
                },
                child: const Text('Amount'),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
