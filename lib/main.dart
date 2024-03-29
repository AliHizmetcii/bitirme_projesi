import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'Model.dart';
import 'indicator.dart';

void main() {
  runApp(const MyApp());
}

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('İstatistik Sayfası'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'MENU',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Mesajlar'),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profil'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Ayarlar'),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: <Widget>[
                ButtonsTabBar(
                  contentPadding: const EdgeInsets.all(12.0),
                  elevation: 2,
                  backgroundColor: Colors.red,
                  unselectedBackgroundColor: Colors.grey[300],
                  unselectedLabelStyle: const TextStyle(color: Colors.black),
                  labelStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  tabs: const [
                    Tab(
                      text: "Günlük",
                    ),
                    Tab(
                      text: "Haftalık",
                    ),
                    Tab(
                      text: "Aylık",
                    ),
                    Tab(
                        //icon: Icon(Icons.directions_bike),
                        text: "Yıllık"),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      Center(
                        child: Graph().buildAspectRatio(),
                      ),
                      Center(
                        child: Graph().buildAspectRatio(),
                      ),
                      Center(
                        child: Graph().buildAspectRatio(),
                      ),
                      Center(
                        child: Graph().buildAspectRatio(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Graph extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return buildAspectRatio();
  }

  AspectRatio buildAspectRatio() {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(touchCallback:
                          (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections()),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Indicator(
                  color: const Color(0xff0293ee),
                  text: productModelList[0].categoryName,
                  isSquare: true,
                  textColor: const Color(0xff0293ee),
                ),
                const SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: const Color(0xfff8b250),
                  text: productModelList[1].categoryName,
                  isSquare: true,
                  textColor: const Color(0xfff8b250),
                ),
                const SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: const Color(0xff845bef),
                  text:productModelList[2].categoryName,
                  isSquare: true,
                  textColor: const Color(0xff845bef),
                ),
                const SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: const Color(0xff13d38e),
                  text: productModelList[3].categoryName,
                  isSquare: true,
                  textColor: const Color(0xff13d38e),
                ),
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          var a = ((100*productModelList[0].productNumber)/(totalProducts));
          String s= a.toStringAsFixed(2);
          double d = double.parse(s);
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: d,
            title: '%$d',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          var a = ((100*productModelList[1].productNumber)/(totalProducts));
          String s= a.toStringAsFixed(2);
          double d = double.parse(s);
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: d,
            title: '%$d',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          var a = ((100*productModelList[2].productNumber)/(totalProducts));
          String s= a.toStringAsFixed(2);
          double d = double.parse(s);
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: d,
            title:'%$d',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          var a = ((100*productModelList[3].productNumber)/(totalProducts));
          String s= a.toStringAsFixed(2);
          double d = double.parse(s);
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: d,
            title: '%$d',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
