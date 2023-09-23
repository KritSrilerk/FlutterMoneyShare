import 'package:flutter/material.dart';

class ShowmoneyshareUI extends StatefulWidget {
  //ตัวแปรที่จะรับค่าที่ส่งมา
  double money, tip, moneyshare;
  int person;

  //constructor ที่จะไว้รับค่าที่ส่งมาเพื่อกำหนดให้กับตัวแปรที่สร้างข้างบน
  ShowmoneyshareUI({
    Key? key,
    required this.money,
    required this.person,
    required this.tip,
    required this.moneyshare,
  }) : super(key: key);

  @override
  _ShowmoneyshareUIState createState() => _ShowmoneyshareUIState();
}

class _ShowmoneyshareUIState extends State<ShowmoneyshareUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEEFFB),
      appBar: AppBar(
        title: Text(
          'ผลการแชร์เงิน',
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[200],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 80.0,
              ),
              Image.asset(
                'assets/images/money.png',
                height: 120.0,
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'จำนวนเงินที่จะหาร '
              ),
              Text(
                widget.money.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.lightBlue[200]
                ),
              ),
              Text(
                ' บาท '
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'จำนวนคนที่จะหาร '
              ),
              Text(
                widget.person.toString(),
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.lightBlue[200]
                ),
              ),
              Text(
                'บาท '
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'จำนวนทิป '
              ),
              Text(
                widget.tip.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.lightBlue[200]
                ),
              ),
              Text(
                'บาท '
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'สรุปหารคนละ '
              ),
              Text(
                widget.moneyshare.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.lightBlue[200]
                ),
              ),
              Text(
                'บาท'
              ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
