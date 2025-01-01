import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
      home: Mains(),
    ));

class Mains extends StatefulWidget {
  @override
  _MainsState createState() => _MainsState();
}
int bal = 10;
int wager = 1;
int r1 = 6;
int r2 = 6;
int r3 = 6;
int r4 = 6;
String w = '';
int a = 2;
String pe = '';
var pc = TextEditingController();
int a1=1;
class _MainsState extends State<Mains> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Bal=$bal',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Alike=$a',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Wager=$wager',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            //SizedBox(height: 40.0),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset(
                    "assets/DiceNumber$r1-ezgif.com-loop-count.gif",
                    height: 150.0,
                    width: 100.0,
                  ),
                  Image.asset(
                    "assets/DiceNumber$r2-ezgif.com-loop-count.gif",
                    height: 150.0,
                    width: 100.0,
                  ),
                  Image.asset(
                    "assets/DiceNumber$r3-ezgif.com-loop-count.gif",
                    height: 150.0,
                    width: 100.0,
                  ),
                  Image.asset(
                    "assets/DiceNumber$r4-ezgif.com-loop-count.gif",
                    height: 150.0,
                    width: 100.0,
                  ),
                ],
            ),
            //SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton.extended(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  onPressed: () {
                    setState(() {
                      if (wager <= bal / 2) a = 2;
                    });
                  },
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.black,
                  label: Text(
                    '2 Alike',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FloatingActionButton.extended(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  onPressed: () {
                    setState(() {
                      if (wager <= bal / 3) a = 3;
                    });
                  },
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  label: Text(
                    '3 Alike',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FloatingActionButton.extended(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  onPressed: () {
                    setState(() {
                      if (wager <= bal / 4) a = 4;
                    });
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.black,
                  label: Text(
                    '4 Alike',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: SizedBox(
                height: 60,
                width: 150,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: pc,
                  onFieldSubmitted: (value) {
                    pc.clear();
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    errorText: pe,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    fillColor: Colors.grey,
                    filled: true,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            //SizedBox(height: 40.0),
            FloatingActionButton.extended(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(500)),
              onPressed: () {
                setState(() {
                  if (wager > bal / a) {
                    pe = "Invalid Wager";
                  }
                  else {
                    pe = '';
                    int s=0;
                    a1=1;
                    r1 = Random().nextInt(6) + 1;
                    r2 = Random().nextInt(6) + 1;
                    r3 = Random().nextInt(6) + 1;
                    r4 = Random().nextInt(6) + 1;
                    if(r1==r2)
                      s++;
                    if(r1==r3)
                      s++;
                    if(r1==r4)
                      s++;
                    if(r2==r3)
                      s++;
                    if(r2==r4)
                      s++;
                    if(r4==r3)
                      s++;
                    if(s==6)
                      a1=4;
                    if(s==3)
                      a1=3;
                    if(s==1 || s==2)
                      a1=2;
                    if(a1==a)
                      bal+=(a*wager);
                    else
                      bal=bal-(a*wager);
                  }
                });
              },
              backgroundColor: Colors.green,
              foregroundColor: Colors.black,
              label: Text(
                'GO',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    pc.addListener(() {
      setState(() {
        wager = int.parse(pc.text);
      });
    });
  }
}
