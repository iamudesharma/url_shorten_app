import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_shorten_app/screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // final con = Get.put(UrlShortenController());
  // con.getUrlLink(
  //     'https://github.com/themaaz32/url_shortener_app/blob/main/lib/screens/url_shortener_state.dart');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: Routes.HOME,
          page: () => HomeScreen(),
        ),
      ],
      title: 'Url Shorten',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

abstract class Routes {
  // static const INITIAL = '/';
  static const HOME = '/';
  static const LOGIN = '/login';
  static const CADASTRO = '/cadastro';
}
