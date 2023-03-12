import 'package:flutter/material.dart';
import 'cal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ตังผู้ใช้งาน
  TextEditingController _userMoney = TextEditingController();
  // ราคาอุปกรณ์
  TextEditingController _mainboard = TextEditingController();
  TextEditingController _cpu = TextEditingController();
  TextEditingController _graphiccard = TextEditingController();
  TextEditingController _storage = TextEditingController();
  TextEditingController _ram = TextEditingController();
  TextEditingController _powersupply = TextEditingController();
  TextEditingController _case = TextEditingController();
  TextEditingController _accessorie = TextEditingController();


  // กรอกข้อมูล
  Widget textFieldInput(
      {String? title,
      bath,
      TextEditingController? textinput,
      void Function(String)? method,
      double width = 160,
      double height = 35}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
            top: 0,
          ),
          child: Text(
            title!,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.orange),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0),
          child: SizedBox(
            height: height,
            width: width,
            child: TextField(
              keyboardType: TextInputType.number,
              controller: textinput,
              onChanged: method,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 0),
          child: Text(
            bath!,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
          ),
        ),
      ],
    );
  }

  void cal() {
    try{Cal.userMoney = double.parse(_userMoney.text);
    Cal.mainboard = double.parse(_mainboard.text);
    Cal.cpu = double.parse(_cpu.text);
    Cal.graphiccard = double.parse(_graphiccard.text);
    Cal.storage = double.parse(_storage.text);
    Cal.ram = double.parse(_ram.text);
    Cal.powersupply = double.parse(_powersupply.text);
    Cal.ccase = double.parse(_case.text);
    Cal.accessorie = double.parse(_accessorie.text);}
    catch(e){
      print(e);
    }

    Cal.totalComputer = (Cal.mainboard +
        Cal.cpu +
        Cal.graphiccard +
        Cal.storage +
        Cal.ram +
        Cal.powersupply +
        Cal.ccase +
        Cal.accessorie);

    Cal.userMoneyCal = (Cal.userMoney - Cal.totalComputer);

    if (Cal.userMoneyCal <= Cal.userMoney*(30/100)) {
      Cal.userMoneyString = "คุณใช้เงินที่มีอยู่ในจำนวนมาก";
    }else if (Cal.userMoneyCal <= Cal.userMoney*(70/100)) {
      Cal.userMoneyString = "คุณใช้เงินที่มีอยู่ในจำนวนปานกลาง";
    }else {
      Cal.userMoneyString = "คุณใช้เงินที่มีอยู่ในจำนวนน้อย";
  }}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text('คำนวณราคาประกอบคอมพิวเตอร์'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 80),
              child: textFieldInput(
                title: 'งบที่คุณมี',
                bath: 'บาท',
                textinput: _userMoney,
              ),
            ),
            SizedBox(height: 10),
            Text("_______________________________________________________"),
            SizedBox(height: 10),
            Text(
              'กรอกราคาอุปกรณ์',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800]),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 18),
              child: textFieldInput(
                title: 'Mainboard',
                bath: 'บาท',
                textinput: _mainboard,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 70),
              child: textFieldInput(
                title: 'CPU',
                bath: 'บาท',
                textinput: _cpu,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 3),
              child: textFieldInput(
                title: 'Graphic Card',
                bath: 'บาท',
                textinput: _graphiccard,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 30),
              child: textFieldInput(
                title: 'HDD/SSD',
                bath: 'บาท',
                textinput: _storage,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 70),
              child: textFieldInput(
                title: 'RAM',
                bath: 'บาท',
                textinput: _ram,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 0),
              child: textFieldInput(
                title: 'Power Supply',
                bath: 'บาท',
                textinput: _powersupply,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 70),
              child: textFieldInput(
                title: 'Case',
                bath: 'บาท',
                textinput: _case,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 12),
              child: textFieldInput(
                title: 'Accessories',
                bath: 'บาท',
                textinput: _accessorie,
              ),
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 80),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _userMoney.clear();
                      Cal.userMoney = 0.0;
                      _mainboard.clear();
                      _cpu.clear();
                      _graphiccard.clear();
                      _storage.clear();
                      _ram.clear();
                      _powersupply.clear();
                      _case.clear();
                      _accessorie.clear();

                    });
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red)),
                  child: const Text('ล้างข้อมูล'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 60),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cal();
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CalPage()),
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green)),
                  child: const Text('คำนวณ'),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class CalPage extends StatelessWidget {
  const CalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text('คำนวณราคาประกอบคอมพิวเตอร์'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                "ยอดรวมทั้งหมด",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "_________________________________________________________________________________",
                style: TextStyle(fontSize: 10),
              ),
              Text(
                "_________________________________________________________________________________",
                style: TextStyle(fontSize: 10),
              ),
              SizedBox(height: 20),
              Text("เงินที่มีอยู่         ${Cal.userMoney} บาท",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("เงินที่ต้องจ่าย   ${Cal.totalComputer} บาท",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
              Text("เงินคงเหลือ      ${Cal.userMoneyCal} บาท",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
              SizedBox(height: 20),
              Text(Cal.userMoney >= Cal.totalComputer?"คุณมีเงินพอสำหรับการซื้อคอมพิวเตอร์" : "คุณมีเงินไม่พอสำหรับการซื้อคอมพิวเตอร์",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Cal.userMoney >= Cal.totalComputer? Colors.green : Colors.red)),
              SizedBox(height: 20),
              Text(Cal.userMoneyString, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
            ]),
      ),
    );
  }
}

