import 'package:flutter/material.dart';
import 'package:google_sheet_db/views/config_barcode_page.dart';
import 'package:google_sheet_db/views/select_scaner_modification_page.dart';
import 'package:google_sheet_db/views/test_barcode_page.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<Widget> _pages;

  List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.toll_outlined),
      label: "Сканер",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.approval),
      label: "Тестовые ШК",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Настройки",
    )
  ];

  late int _selectedPage;

  @override
  void initState() {
    super.initState();
    _selectedPage = 0;

    _pages = [
      MyPage(
        1,
        "Page 01",
        MyKeys.getKeys().elementAt(0),
      ),
      // This avoid the other pages to be built unnecessarily
      ConfigBarcodesPage(),
      TestBarcodePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode helper'),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () async {
          return !await Navigator.maybePop(
            MyKeys.getKeys()[_selectedPage].currentState!.context,
          );
        },
        child: IndexedStack(
          index: _selectedPage,
          children: _pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: _selectedPage,
        onTap: (index) {
          setState(() {
            // now check if the chosen page has already been built
            // if it hasn't, then it still is a SizedBox
            if (_pages[index] is SizedBox) {
              if (index == 1) {
                _pages[index] = MyPage(
                  1,
                  "Page 02",
                  MyKeys.getKeys().elementAt(index),
                );
              } else {
                _pages[index] = MyPage(
                  1,
                  "Page 03",
                  MyKeys.getKeys().elementAt(index),
                );
              }
            }

            _selectedPage = index;
          });
        },
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  MyPage(this.count, this.text, this.navigatorKey);
  final count;
  final text;
  final navigatorKey;
  @override
  Widget build(BuildContext context) {
    // You'll see that it will only print once
    print("Building $text with count: $count");
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return SelectScanerModification();
          },
        );
      },
    );
  }
}

class MyKeys {
  static final first = GlobalKey(debugLabel: 'page1');
  static final second = GlobalKey(debugLabel: 'page2');
  static final third = GlobalKey(debugLabel: 'page3');

  static List<GlobalKey> getKeys() => [first, second, third];
}
