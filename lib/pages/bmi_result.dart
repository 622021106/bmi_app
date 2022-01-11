import 'package:flutter/material.dart';

class BMIresult extends StatefulWidget {
  const BMIresult({Key? key, this.weight, this.height, this.bmi, this.txt})
      : super(key: key);
  final String? weight;
  final String? height;
  final String? bmi;
  final String? txt;

  @override
  _BMIresultState createState() => _BMIresultState();
}

class _BMIresultState extends State<BMIresult> {
  double? _bmi;
  String? _txt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ผลการคำนวณ'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/12.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 20)),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    calculate();
                  },
                  child: const Text(
                    'คำนวณ',
                    style: TextStyle(fontSize: 22),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(500, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                bmi(),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                txt(),
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'คำนวณใหม่',
                style: TextStyle(fontSize: 22),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(500, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container txt() {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 5)),
          const Text(
            'รูปร่าง',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Text(
            _txt == null ? '' : _txt!.toString(),
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Container bmi() {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 25, 30, 10),
      padding: const EdgeInsets.only(top: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 5)),
          const Text(
            'ดัชนีมวลกาย (BMI)',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Text(
            _bmi == null ? '' : _bmi!.toStringAsFixed(2),
            style: const TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void calculate() {
    double w = double.parse(widget.weight!);
    double h = double.parse(widget.height!) / 100;
    double hh = h * h;

    setState(() {
      double bmi = w / hh;
      _bmi = bmi;

      if (_bmi! < 18.5) {
        _txt = 'น้ำหนักน้อยเกินไป';
      } else if (_bmi! <= 22.99) {
        _txt = 'น้ำหนักปกติ';
      } else if (_bmi! <= 24.99) {
        _txt = 'น้ำหนักเกิน(ท้วม)';
      } else if (_bmi! <= 29.99) {
        _txt = 'อ้วนระดับ 1 (อ้วนระยะเริ่มต้น)';
      } else if (_bmi! <= 39.99) {
        _txt = 'อ้วนระดับ 2 (อ้วนมาก)';
      } else {
        _txt = 'อ้วนระดับ 3 (อ้วนระดับรุนแรงมาก)';
      }
    });
  }
}
