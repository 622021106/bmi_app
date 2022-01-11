// import 'dart:js';

import 'package:bmiadpp/pages/bmi_main.dart';
import 'package:flutter/material.dart';
import 'bmi_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              menuHeader(),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              welcomeText(),
              Image.asset(
                'images/3373122.png',
                width: 250,
              ),
              Padding(padding: EdgeInsets.only(bottom: 100)),
              bottomBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Row menuHeader() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      TextButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.help),
        label: const Text('ความช่วยเหลือ'),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.greenAccent),
        ),
      ),
      TextButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.info),
        label: const Text('เกี่ยวกับแอป'),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.greenAccent),
        ),
      ),
      TextButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.settings),
        label: const Text('ตั้งค่า'),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.greenAccent),
        ),
      ),
      TextButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.call),
        label: const Text('ติดต่อเรา'),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.greenAccent),
        ),
      )
    ]);
  }

  Column welcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Padding(padding: EdgeInsets.only(top: 30)),
        Text(
          'แอปพลิเคชันคำนวณ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50,
            color: Colors.white,
          ),
        ),
        Text(
          '',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        Text(
          '',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  SizedBox bottomBtn() {
    return SizedBox(
      width: 500,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BMIPage(),
                ));
          },
          child: const Text(
            'เข้าสู่ระบบ',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
            foregroundColor: MaterialStateProperty.all(Colors.blue),
          ),
        ),
      ),
    );
  }
}
