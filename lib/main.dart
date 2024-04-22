import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_ultimate/Login/controller/provider/login_provider.dart';
import 'package:task_ultimate/Orders/controller/provider/order_provider.dart';
import 'package:task_ultimate/language/provider/app_languages.dart';
import 'package:task_ultimate/services/api_handler/general_api_state.dart';
import 'package:task_ultimate/utilties/route/routes.dart';
import './Shared/shared_obj.dart';
import './locale/locales.dart';
import 'dart:io';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await SharedObj().init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) =>
      runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider<AppLanguage>(create: (_) => AppLanguage()),
          ChangeNotifierProvider<GeneralApiState>(create: (_) => GeneralApiState()),
          ChangeNotifierProvider<OrderProvider>(create: (_) => OrderProvider()),
          ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
        ],
        child: TaskApp(),
      )));


}

class TaskApp extends StatefulWidget {
  TaskApp({Key? key}) : super(key: key);

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  State<TaskApp> createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {

  String? _nativePlatformLibraryVersion = 'Unknown';




  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final appLan = Provider.of<AppLanguage>(context);
    appLan.fetchLocale();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) => MaterialApp(
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        navigatorKey: SharedObj.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: appLan.appLanguage == Languages.ar ? 'تاسك' : "UltimateTask",
        initialRoute: "/",
        locale: appLan.appLocal,
        routes: Routes.routesMap,
        supportedLocales: Languages.values.map((e) => Locale(e.name)).toList(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
      ),
    );
  }
}
