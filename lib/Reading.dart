// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Reading extends StatefulWidget {
  const Reading({Key? key}) : super(key: key);

  @override
  _ReadingState createState() => _ReadingState();
}

class _ReadingState extends State<Reading> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  String result = '0';

  void sum() {
    double unit = double.parse(num2.text) - double.parse(num1.text);
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
  void dispose() {
    num1.dispose();
    num2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: num1,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Old Reading "),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: num2,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter New Reading "),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      child: Text('Amount'),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(
                                  ' \t ₹ ' + result,
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              );
                            });
                        setState(() {
                          sum();
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        num1.clear();
                        num2.clear();
                      },
                      child: Text('clear'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
