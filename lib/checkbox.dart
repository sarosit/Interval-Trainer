import 'package:flutter/material.dart';

class IntervalCheckbox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IntervalCheckbox();
}

class _IntervalCheckbox extends State<IntervalCheckbox> {
  Map<int, String> allIntervals = {
    0: 'Minor 2nd',
    1: '2nd',
    2: 'Minor 3rd',
    3: '3rd',
    4: '4th',
    5: 'Augmented 4th',
    6: 'Diminished 5th',
    7: '5th',
    8: 'Augmented 5th',
    9: 'Minor 6th',
    10: '6th',
    11: 'Minor 7th',
    12: '7th'
  };
  Map<int, String> includedIntervals = {};

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose your Intervals!'),
        ),
        body: intervalSelector());
  }
  ListView intervalSelector() {
    return ListView.builder(
        itemCount: allIntervals.length,
        itemBuilder: (BuildContext context, index) {
          return Card(
              child: ListTile(
                  onTap: () {
                    includedIntervals.containsKey(allIntervals[index]) ?
                        includedIntervals.removeWhere((key, value) => key == index) :
                        includedIntervals[index] = allIntervals[index];

                    print(includedIntervals);
                  },
                  title: Text(allIntervals[index]),



              ));
        });
  }
}
