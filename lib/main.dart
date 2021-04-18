import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'dart:math';
import 'package:interval_trainer/checkbox.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Interval Trainer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var checkbox = IntervalCheckbox();
  // Map allIntervals = {
  //   1: 'b2',
  //   2: '2',
  //   3: 'b3',
  //   4: '3',
  //   5: '4',
  //   6: 'aug4',
  //   7: 'b5',
  //   8: '5',
  //   9: '#5',
  //   10: 'b6',
  //   11: '6',
  //   12: 'b7',
  //   13: '7',
  //   14: '8',
  //   15: 'b9',
  //   16: '9',
  //   17: '#9',
  //   18: 'b10',
  //   19: '10',
  //   20: 'b11',
  //   21: '11',
  //   22: '#11',
  //   23: 'b12',
  //   24: '12',
  //   25: '#12',
  //   26: 'b13',
  //   27: '13',
  //   28: 'b14',
  //   29: '14'
  // };
  Map<int, String> allIntervals = {
    1: 'Minor 2nd',
    2: '2nd',
    3: 'Minor 3rd',
    4: '3rd',
    5: '4th',
    6: 'Augmented 4th',
    7: 'Diminished 5th',
    8: '5th',
    9: 'Augmented 5th',
    10: 'Minor 6th',
    11: '6th',
    12: 'Minor 7th',
    13: '7th'
  };
  String interval = '2nd';

  keyGetter(value){
    return allIntervals.keys.firstWhere((el) => allIntervals[el] == value, orElse: () => null);
  }

  _randomNum(max) {
    var rng = new Random();
    return rng.nextInt(max);
  }
  _displayRandomIntervalUp() => () {
    int min = keyGetter(this.interval), max = 12;
    int intervalIndex = _randomNum(max - min) + min;
    setState(() {
      interval = allIntervals[intervalIndex];
      print(interval);
    });
  };
  _displayRandomIntervalDown() => () {
    int max = keyGetter(this.interval);
    setState(() {
      int intervalIndex = _randomNum(max);
      interval = allIntervals[intervalIndex];
    });
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        color: Colors.orangeAccent,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    return Colors.deepOrange;
                  },
                ),
              ),
              child: Text('Choose Intervals'),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IntervalCheckbox())
                );
              }
          ),
          Center(
              child: Container(
                  margin: EdgeInsets.only(top: 50),
                  width: MediaQuery.of(context).size.width *2/3,
                  height: MediaQuery.of(context).size.height /3,
                  decoration: BoxDecoration(
                    // border: Border.all(),
                    color: Colors.yellow.shade100,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(6, 6)
                      )
                    ]
                  ),
                  child: Center(
                    child: Text(
                      interval,
                      style: TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                  )))),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.only(top: 50),
                    width: MediaQuery.of(context).size.width *3/7,
                    height: MediaQuery.of(context).size.height /5,
                    margin: EdgeInsets.all(5),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    return Colors.deepOrange;
                              },
                            ),
                            alignment: Alignment.center,
                            padding: MaterialStateProperty.all(
                                EdgeInsets.fromLTRB(0, 30, 0, 30))),
                        onPressed: _displayRandomIntervalDown(),
                        child: Text('Down', textAlign: TextAlign.center))),
                Container(
                    padding: EdgeInsets.only(top: 50),
                    width: MediaQuery.of(context).size.width *3/7,
                    height: MediaQuery.of(context).size.height /5,
                    margin: EdgeInsets.all(5),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                return Colors.deepOrange;
                              },
                            ),
                            alignment: Alignment.center,
                            padding: MaterialStateProperty.all(
                                EdgeInsets.fromLTRB(0, 30, 0, 30))),
                        onPressed: _displayRandomIntervalUp(),
                        child: Text('Up', textAlign: TextAlign.center))),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
