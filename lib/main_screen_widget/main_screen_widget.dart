import 'package:flutter/material.dart';
import 'package:google_sheet_db/views/barcode_list.dart';
import 'package:google_sheet_db/views/barcodes_hive_list.dart';

class MainScreenWiget extends StatefulWidget {
  MainScreenWiget({Key? key}) : super(key: key);

  @override
  _MainScreenWigetState createState() => _MainScreenWigetState();
}

class _MainScreenWigetState extends State<MainScreenWiget> {
  int _selectedTab = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    BarcodesList(),
    BarcodePageWidget(),
    Center(child: Text('Функция еще в разработке')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Barcodes halper',
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.toll_outlined),
            label: 'Impulse 12',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.approval),
            label: 'Тестовые ШК',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }
}
