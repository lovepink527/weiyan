import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weiyan/public.dart';
import 'package:weiyan/pages/splash_page.dart';
import 'package:weiyan/util/sp_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.init();
  runApp(new MyApp( ));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xffffffff),
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Color(0x333333),
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light));
  Routes.configureRoutes(Routes.router);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "微言",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        onGenerateRoute: Routes.router.generator,
        home: SplashPage());
  }
}
