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
      home: const MyHomePage(title: 'Material demo'),
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
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _controller;

  void toggleBottomSheet() {
    if (_controller == null) {
      print('open bottomSheet');
      _controller =
          scaffoldKey.currentState?.showBottomSheet((context) => Container(
                color: Colors.amber,
                height: 150,
                child: const Center(child: Text('TEST')),
              ));
    } else {
      print('close bottomSheet');
      _controller?.close();
      _controller = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            Builder(
                builder: ((context) => IconButton(
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                      icon: const Icon(Icons.account_circle_outlined),
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    )))
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(children: [
            const DrawerHeader(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.deepOrange,
                backgroundImage: NetworkImage('https://picsum.photos/200'),
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
        endDrawer: Drawer(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.deepOrange,
                  backgroundImage: NetworkImage('https://picsum.photos/200'),
                ),
                SizedBox(height: 10),
                Text('Username')
              ],
            ),
          ),
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
        bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            elevation: 10,
            notchMargin: 5,
            clipBehavior: Clip.antiAlias,
            child: Container(
              child: BottomNavigationBar(
                elevation: 0,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle_outlined),
                      label: 'Profile'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.image_outlined), label: 'Images'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.folder_outlined), label: 'Files')
                ],
              ),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.currency_ruble_outlined),
          onPressed: toggleBottomSheet,
        ),
        // bottomSheet: BottomSheet(
        //   builder: (context) => Container(height: 150, child: Center()),
        //   onClosing: () {},
        // ),
      ),
    );
  }
}
