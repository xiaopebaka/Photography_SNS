import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  // String _type = "偶数";
  void _incrementCounter() {
    setState(() {
      _counter++;
      // if(_counter % 2 ==0) {
      //     _type = "偶数";
      // }else{
      //   _type = "奇数";
      // }
    });
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(children: const [
         Icon(Icons.create),
         Text("初めてのタイトル"),
        ]
        ),
      ),
        endDrawer: const Drawer(child: Center(child: Text("Drawer"))),
      body: Column(children: [
        const Text("初めてのテキスト"),
        Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
        ),
        if(_counter % 2 ==1)const Text(
            '奇数です',
            style: TextStyle(fontSize: 20, color: Colors.red)
        ),
        if(_counter % 2 ==0)const Text(
          '偶数です',
          style: TextStyle(fontSize: 20, color: Colors.red)
        ),
        TextButton(
          onPressed: () => {debugPrint("ボタンがおされたよ")},
          child: const Text("更新"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 24.0,
            ),
            Icon(
              Icons.audiotrack,
              color: Colors.green,
              size: 30.0,
            ),
            Icon(
              Icons.beach_access,
              color: Colors.blue,
              size: 36.0,
            ),
          ]
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          Uri url = Uri.parse("http://www.google.com");
          if (await canLaunchUrl(url)){
            await launchUrl(url);
          }
        },
            child: const Icon(Icons.timer)
      ),
    );
  }
}
