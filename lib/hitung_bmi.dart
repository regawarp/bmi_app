import 'package:flutter/material.dart';

class HitungBmi extends StatefulWidget {
  @override
  _HitungBmiState createState() => _HitungBmiState();
}

class _HitungBmiState extends State<HitungBmi> {
  final _formKey = GlobalKey<FormState>();
  var beratBadan, tinggiBadan;
  double bmiValue = 0;
  var kategoriBmi = "-";

  TextEditingController beratBadanController = TextEditingController();
  TextEditingController tinggiBadanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 100,
        title: Text('Kalkulator BMI'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            color: Colors.green,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: beratBadanController,
                    keyboardType: TextInputType.number,
                    onSaved: (var value) {
                      beratBadan = double.parse(value);
                    },
                    decoration: new InputDecoration(
                      labelText: "Berat badan (kg)",
                      icon: Icon(Icons.insert_emoticon),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return "Masukkan berat badan anda";
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: tinggiBadanController,
                    keyboardType: TextInputType.number,
                    onSaved: (var value) {
                      tinggiBadan = double.parse(value);
                    },
                    decoration: new InputDecoration(
                      labelText: "Tinggi badan (cm)",
                      icon: Icon(Icons.straighten),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return "Masukkan tinggi badan anda";
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new RaisedButton(
                    child: const Text('Hitung'),
                    onPressed: () {
                      print(beratBadanController.text);
                      setState(() {
                        bmiValue = hitungBmi(
                            double.parse(beratBadanController.text),
                            double.parse(tinggiBadanController.text));
                        kategoriBmi = tentukanKategoriBmi(bmiValue);
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("BMI = "),
                    Text("${bmiValue.toStringAsFixed(2)} kg/m2"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Kategori = "),
                    Text("$kategoriBmi"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double hitungBmi(double beratBadan, double tinggiBadan) {
    double bmi = beratBadan / (tinggiBadan * tinggiBadan) * 10000;
    return bmi;
  }

  String tentukanKategoriBmi(double bmi) {
    if (bmi < 18.5) {
      return "Berat Badan Kurang";
    } else if (bmi < 22.9) {
      return "Berat Badan Normal";
    } else if (bmi < 29.9) {
      return "Berat Badan Berlebih (kecenderungan obesitas)";
    } else {
      return "Obesitas";
    }
  }
}
