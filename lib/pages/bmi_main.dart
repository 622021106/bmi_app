import 'package:bmiadpp/pages/bmi_result.dart';
import 'package:flutter/material.dart';

import 'bmi_result.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({Key? key}) : super(key: key);

  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _height = TextEditingController();

  late double _bmi;
  late String _txt;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('กรอกข้อมูลของคุณ'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/wp7092429.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              const Padding(padding: EdgeInsets.only(top: 25)),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    weight(),
                    hight(),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var route = MaterialPageRoute(
                      builder: (context) => BMIresult(
                        weight: _weight.text,
                        height: _height.text,
                      ),
                    );
                    Navigator.push(context, route);
                  }
                },
                child: const Text(
                  'ยืนยัน',
                  style: TextStyle(fontSize: 30),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(500, 100),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox hight() {
    return SizedBox(
      width: 500,
      child: TextFormField(
        controller: _height,
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกส่วนสูง';
          }
        },
        keyboardType: TextInputType.number,
        maxLength: 3,
        decoration: const InputDecoration(
          fillColor: Colors.cyanAccent,
          filled: true,
          label: Text('ส่วนสูง                 (เซนติเมตร)',
              style: TextStyle(fontSize: 20)),
          prefixIcon: Icon(Icons.height),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                width: 2,
                color: Colors.white,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                width: 2,
                color: Colors.white,
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                width: 10,
                color: Colors.red,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                width: 2,
                color: Colors.greenAccent,
              )),
        ),
      ),
    );
  }

  SizedBox weight() {
    return SizedBox(
      width: 500,
      child: TextFormField(
        controller: _weight,
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกน้ำหนัก';
          }
        },
        keyboardType: TextInputType.number,
        maxLength: 3,
        decoration: const InputDecoration(
          fillColor: Colors.cyanAccent,
          filled: true,
          label: Text('น้ำหนัก                 (กิโลกรัม)',
              style: TextStyle(fontSize: 20)),
          prefixIcon: Icon(Icons.line_weight),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                width: 2,
                color: Colors.white,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                width: 2,
                color: Colors.white,
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                width: 10,
                color: Colors.white,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                width: 2,
                color: Colors.yellowAccent,
              )),
        ),
      ),
    );
  }
}
