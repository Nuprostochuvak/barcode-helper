import 'package:flutter/material.dart';
import 'package:google_sheet_db/widgets/main_screen_widget.dart';

void main() {
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
