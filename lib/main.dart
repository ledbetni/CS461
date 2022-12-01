import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veterinary Application',
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
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Veterinary Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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

class Animal {
  final String title;

  Animal(this.title);
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Animal> animals = [
    Animal('Dog'),
    Animal('Cat'),
    Animal('Equine'),
    Animal('Goat'),
    Animal('Sheep/Goat'),
    Animal('Pig'),
    Animal('Cattle'),
    Animal('Camelid'),
  ];

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
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: animals.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(animals[index].title),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(animal: animals[index])));
                });
          }
          // children: <Widget>[
          //   ListTile(
          //     title: Center(child: Text(animals[0].title)),
          //     shape: RoundedRectangleBorder(
          //       side: BorderSide(color: Colors.black),
          //       borderRadius: BorderRadius.circular(20.0),
          //     ),
          //     onTap: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => DetailScreen(animal: animals[index])
          //     )
          //       )
          //     }
          //   ),
          //   ListTile(
          //     title: Center(child: Text(animals[1].title)),
          //     shape: RoundedRectangleBorder(
          //       side: BorderSide(color: Colors.black),
          //       borderRadius: BorderRadius.circular(20.0),
          //     ),
          //   ),
          //   ListTile(
          //     title: Center(child: Text(animals[2].title)),
          //     shape: RoundedRectangleBorder(
          //       side: BorderSide(color: Colors.black),
          //       borderRadius: BorderRadius.circular(20.0),
          //     ),
          //   ),
          //   ListTile(
          //     title: Center(child: Text(animals[3].title)),
          //     shape: RoundedRectangleBorder(
          //       side: BorderSide(color: Colors.black),
          //       borderRadius: BorderRadius.circular(20.0),
          //     ),
          //   ),
          //   ListTile(
          //     title: Center(child: Text(animals[4].title)),
          //     shape: RoundedRectangleBorder(
          //       side: BorderSide(color: Colors.black),
          //       borderRadius: BorderRadius.circular(20.0),
          //     ),
          //   ),
          //   ListTile(
          //     title: Center(child: Text(animals[5].title)),
          //     shape: RoundedRectangleBorder(
          //       side: BorderSide(color: Colors.black),
          //       borderRadius: BorderRadius.circular(20.0),
          //     ),
          //   ),
          //   ListTile(
          //     title: Center(child: Text(animals[6].title)),
          //     shape: RoundedRectangleBorder(
          //       side: BorderSide(color: Colors.black),
          //       borderRadius: BorderRadius.circular(20.0),
          //     ),
          //   ),
          //   ListTile(
          //     title: Center(child: Text(animals[7].title)),
          //     shape: RoundedRectangleBorder(
          //       side: BorderSide(color: Colors.black),
          //       borderRadius: BorderRadius.circular(20.0),
          //     ),
          //   ),
          // ],
          ),
      // This trailing comma makes auto-formatting nicer for build methods.
      // ignore: prefer_const_literals_to_create_immutables
      bottomNavigationBar: BottomNavigationBar(iconSize: 30, items: [
        const BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(Icons.search),
            backgroundColor: Colors.red),
        const BottomNavigationBarItem(
            label: 'Home', icon: Icon(Icons.home), backgroundColor: Colors.red),
        const BottomNavigationBarItem(
            label: 'Calculator',
            icon: Icon(Icons.calculate),
            backgroundColor: Colors.red),
      ]),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.animal});

  final Animal animal;

  final String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  Widget build(BuildContext context) {
    //final animal = ModalRoute.of(context)!.settings.arguments as Animal;

    return Scaffold(
        appBar: AppBar(
          title: Text(animal.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(loremIpsum),
        ));
  }
}
