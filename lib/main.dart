import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
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
        home: const MyHomePage(title: 'Flutter Demo Home Page'));
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
                  'Başlık',
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
                leading: Icon(Icons.account_circle),
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
          padding: const EdgeInsets.fromLTRB(0,10,0,0),
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: <Widget>[
                ButtonsTabBar(
                  contentPadding:const EdgeInsets.all(12.0),
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
                        child: graph().buildAspectRatio(),
                      ),
                      Center(
                        child: graph().buildAspectRatio(),
                      ),
                      Center(
                        child: graph().buildAspectRatio(),
                      ),
                      Center(
                        child: graph().buildAspectRatio(),
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

class graph extends State {
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
              children: const <Widget>[
                Indicator(
                  color: Color(0xff0293ee),
                  text: 'First',
                  isSquare: true,
                  textColor: Color(0xff0293ee),
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xfff8b250),
                  text: 'Second',
                  isSquare: true,
                  textColor: Color(0xfff8b250),
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xff845bef),
                  text: 'Third',
                  isSquare: true,
                  textColor: Color(0xff845bef),
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xff13d38e),
                  text: 'Fourth',
                  isSquare: true,
                  textColor: Color(0xff13d38e),
                ),
                SizedBox(
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
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
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

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
