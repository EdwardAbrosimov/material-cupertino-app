import 'package:flutter/material.dart';

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
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const MyHomePage(title: 'Material App'),
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(children: [
            const DrawerHeader(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.deepOrange,
              ),
            ),
            const ListTile(
              leading: Icon(Icons.account_circle_outlined),
              title: Text('Profile'),
              trailing: Icon(Icons.arrow_forward_outlined),
            ),
            const ListTile(
              leading: Icon(Icons.image_outlined),
              title: Text('Images'),
              trailing: Icon(Icons.arrow_forward_outlined),
            ),
            const ListTile(
              leading: Icon(Icons.folder_outlined),
              title: Text('Files'),
              trailing: Icon(Icons.arrow_forward_outlined),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // const Spacer(),
                OutlinedButton(
                    style: TextButton.styleFrom(fixedSize: const Size(125, 25)),
                    onPressed: () {},
                    child: const Text('Exit')),
                OutlinedButton(
                    style: TextButton.styleFrom(fixedSize: const Size(125, 25)),
                    onPressed: () {},
                    child: const Text('Registration')),
                // const Spacer(),
              ],
            )
          ]),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'Simple app',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
