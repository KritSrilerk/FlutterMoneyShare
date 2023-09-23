import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app_moneyshare/views/showmoneyshare_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoneyshareUI extends StatefulWidget {
  const MoneyshareUI({Key? key}) : super(key: key);

  @override
  _MoneyshareUIState createState() => _MoneyshareUIState();
}

class _MoneyshareUIState extends State<MoneyshareUI> {
  bool tipcheck = false;

  TextEditingController txtMoney = TextEditingController();
  TextEditingController txtPerson = TextEditingController();
  TextEditingController txtTip = TextEditingController();

  // Method แสดง dialog โดยรับข้อความที่จะแสดงมาจากจุดที่เรียกใช้
  showWaringDialog(context, msg) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.lightBlue[200],
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'คำเตือน',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          content: Text(
            msg,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ตกลง',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent[100],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0FEFF),
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent[100],
        title: Text(
          'แชร์เงินกันเถอะ',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                'assets/images/money.png',
                height: 120.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                child: TextField(
                  controller: txtMoney,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pinkAccent,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pinkAccent,
                      ),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.moneyBillWave,
                      color: Colors.pinkAccent[100],
                    ),
                    hintText: 'ป้อนจำนวนเงิน (บาท)',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                child: TextField(
                  controller: txtPerson,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pinkAccent,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pinkAccent,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.pinkAccent[100],
                    ),
                    hintText: 'ป้อนจำนวนคน (คน)',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    onChanged: (data) {
                      setState(() {
                        if (data != null) {
                          tipcheck = data;
                          if (data == false) {
                            txtTip.text = '';
                          }
                        }
                      });
                    },
                    value: tipcheck,
                    activeColor: Colors.pinkAccent,
                    checkColor: Colors.white,
                    side: BorderSide(
                      color: Colors.pinkAccent,
                    ),
                  ),
                  Text(
                    'ทิปให้เด็กเสริฟ',
                    style: TextStyle(color: Color(0xff333333)),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                child: TextField(
                  controller: txtTip,
                  enabled: tipcheck,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pinkAccent,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pinkAccent,
                      ),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.coins,
                      color: Colors.pinkAccent[100],
                    ),
                    hintText: 'ป้อนจำนวนทิป (บาท)',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 40.0,
                  left: 40.0,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // ตรวจสอบการป้อนต่างๆว่าได้ป้อนหรือยังถ้ายังแสดง dialog แจ้งเตือน
                    if (txtMoney.text.length == 0) {
                      // แสดง dialog
                      showWaringDialog(context, 'กรุณาป้อนจำนวนเงินด้วย.....');
                    } else if (txtPerson.text.length == 0) {
                      // แสดง dialog
                      showWaringDialog(context, 'กรุณาป้อนจำนวนคนด้วย.....');
                    } else {
                      // พร้อมคำนวณ
                      double money = 0, tip = 0, moneyshare = 0;
                      int person = 0;

                      //แปลงข้อความเป็นตัวเลข
                      money = double.parse(txtMoney.text);
                      person = int.parse(txtPerson.text);
                      
                      if (tipcheck == true) {
                        if (txtTip.text.length == 0) {
                        // แสดง dialog
                        showWaringDialog(context, 'กรุณาป้อนจำนวนทิปด้วย.....');
                        return; //ออกจากการทำงานไม่ทำที่เหลือ
                      }
                        tip = double.parse(txtTip.text);
                      }

                      //คำนวณ
                      moneyshare = (money + tip) / person;

                      //ส่งไปแสดงผลที่หน้า showmoneyshareUI
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ShowmoneyshareUI(
                              money: money,
                              person: person,
                              tip: tip,
                              moneyshare: moneyshare,
                            );
                          },
                        ),
                      );
                    }
                  },
                  child: Text(
                    'คำนวณ',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent[100],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                      50.0,
                    )),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 40.0,
                  left: 40.0,
                ),
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(
                      () {
                        txtMoney.text = '';
                        txtPerson.text = '';
                        tipcheck = false;
                        txtTip.text = '';
                      },
                    );
                  },
                  icon: Icon(
                    Icons.refresh,
                  ),
                  label: Text('ยกเลิก'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                      50.0,
                    )),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Created by SAU 2021',
                style: TextStyle(
                  color: Color(0xFF454545),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
