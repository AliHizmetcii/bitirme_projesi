import 'package:bitirme_projesi/login.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dataMap = <String, double>{
    "Flutter": 5,
  };

  final colorList = <Color>[
    Colors.greenAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pie Chart 1"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: PieChart(
          dataMap: dataMap,
          chartType: ChartType.ring,
          baseChartColor: Colors.grey[300]!,
          colorList: colorList,
        ),
      ),
    );
  }
}
