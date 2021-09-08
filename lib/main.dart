import 'package:bmi_app/hitung_bmi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'HealthApp'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(children: <Widget>[
            Text(
              "BMI",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
                "Body Mass Index (BMI) atau yang sering dikenal dengan Indeks Massa Tubuh (IMT) adalah nilai ukur untuk mengetahui status gizi seseorang berdasarkan berat dan tinggi badannya. Nilai BMI (IMT) juga dapat menjadi alat skrining awal untuk mengetahui risiko seseorang terhadap suatu penyakit.\n"
                "Nilai BMI (IMT) yang tinggi menandakan bahwa Anda kelebihan berat badan (overweight atau obesitas). Sementara, nilai BMI (IMT) yang rendah artinya Anda kekurangan gizi dan memiliki berat badan rendah. Namun IMT tidak bisa membedakan persen lemak tubuh dan persen massa otot. Sementara, persen lemak tubuh lebih bisa memberikan gambaran terkait risiko penyakit kronis."),
            RaisedButton(
                child: Text('Hitung BMI'),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HitungBmi()));
                }),
          ]),
        ),
      ),
    );
  }
}
