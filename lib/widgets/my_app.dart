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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Barcode helper'),
            Text('Barcode helper'),
          ],
        ),
        centerTitle: true,
      ),
      body: _pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPage,
        onTap: (index) {
          setState(() => _selectedPage = index);
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

//keep alive tabs
/*WillPopScope(
        onWillPop: () async {
          return !await Navigator.maybePop(
            MyKeys.getKeys()[_selectedPage].currentState!.context,
          );
        },
        child: IndexedStack(
          index: _selectedPage,
          children: _pages,
        ),
      ),*/