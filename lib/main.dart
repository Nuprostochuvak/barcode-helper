import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'main_screen_widget/main_screen_widget.dart';
import 'models/barcode_hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Hive.initFlutter();
  Hive.registerAdapter(BarcodeHiveAdapter());
  await Hive.openBox('barcodes_box');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color(0xff0000cc),
        ),
      ),
      routes: {
        //'/auth': (context) => AuthWiget(),
        '/main_screen': (context) => MainScreenWiget(),
      },
      initialRoute: '/main_screen',
      //onGenerateRoute: (RouteSettings settings) {
      //  return MaterialPageRoute<void>(builder: (context) {
      //    return Scaffold(
      //      body: Center(
      //        child: Text('Произошла ошибка навигации'),
      //      ),
      //   );
      //  });
      // },
    );
  }
}
