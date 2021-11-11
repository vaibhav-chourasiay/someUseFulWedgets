import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material Degin Wei*",
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Material"),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search_rounded),
            )
          ],
        ),
        drawer: Drawer(),
        body: TabBarView(
          controller: tabController,
          children: [
            NewPage(title: "FIRST PAGE"),
            NewPage(title: "SECOND PAGE"),
          ],
        ),
        bottomNavigationBar: Material(
          color: Theme.of(context).primaryColor,
          child: TabBar(
            controller: tabController,
            tabs: [
              Tab(
                child: Icon(Icons.hardware),
              ),
              Tab(
                child: Icon(Icons.record_voice_over),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MySnackBar extends StatefulWidget {
  const MySnackBar({Key? key}) : super(key: key);

  @override
  _MySnackBarState createState() => _MySnackBarState();
}

class _MySnackBarState extends State<MySnackBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Button Is CLick",
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
          );
        },
        child: Text("Click Me"),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(12.0),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    ));
  }
}

class MyDilogBox extends StatefulWidget {
  @override
  _MyDilogBoxState createState() => _MyDilogBoxState();
}

class _MyDilogBoxState extends State<MyDilogBox> {
  AlertDialog al = AlertDialog(
    title: Text("ALert Dialog Box"),
    content: Container(
      height: 300.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hello !"),
          Text("My Friend ."),
        ],
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: ElevatedButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => al);
        },
        child: Text("Show Dilog Box"),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(12.0),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    ));
  }
}

class NewPage extends StatelessWidget {
  final String title;

  const NewPage({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(title),
      ),
    );
  }
}
