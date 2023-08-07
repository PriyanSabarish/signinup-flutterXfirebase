//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final currentUser = FirebaseAuth.instance.currentUser;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Messages',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  //Future username = FirebaseFirestore.instance.collection("users").doc(currentUser!.uid)
  //.get().then((value) => value.data()!["username"]);
  /* void retrieveOnce() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.uid)
        .get()
        .then(
          (value) => {
            setState(() {
              username = value.data()!['username'];
            })
          },
        );

    print(username + "sds");
  }
 */

  @override
  void initState() {
    super.initState();
    // getUserInfo();
    // retrieveOnce();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 25, 25, 25),
            title: const Center(child: Text("X")),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                tooltip: 'Open shopping cart',
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
              )
            ]),
        bottomNavigationBar: Container(
          color: const Color.fromARGB(255, 25, 25, 25),
          child: GNav(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            backgroundColor: const Color.fromARGB(255, 25, 25, 25),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: const Color.fromARGB(255, 35, 35, 35),
            gap: 10,
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
              GButton(
                icon: IconData(0xe3e0, fontFamily: 'MaterialIcons'),
                text: 'Messages',
              ),
            ],
          ),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),

        /*const DefaultTabController(
          length: 2, // Replace 3 with the number of tabs you want
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.home), text: 'Home'),
                  Tab(icon: Icon(Icons.search), text: 'Search'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text('Home Tab Content')),
                    Center(child: Text('Search Tab Content')),
                  ],
                ),
              ),
            ],
          ),
        ),*/
      ),
    );
  }
}

Widget customBottomNavigationBar(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 9, 9, 9), // Dark grey background color
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    child: const GNav(
      backgroundColor: Color.fromARGB(255, 33, 33, 33),
      color: Colors.white,
      gap: 8,
      tabs: [
        GButton(
          icon: Icons.home,
          text: 'Home',
        ),
        GButton(
          icon: Icons.search,
          text: 'Search',
        ),
        GButton(
          icon: Icons.person,
          text: 'Profile',
        ),
        GButton(
          icon: Icons.message,
          text: 'Messages',
        ),
      ],
    ),
  );
}
