import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_2/app_routes.dart';
// import 'package:flutter_application_2/presentation/pages/auth/auth_gate.dart';
// import 'package:flutter_application_2/presentation/pages/auth/pageview.dart';
// import 'package:flutter_application_2/presentation/pages/auth/welcome.dart';
import 'package:flutter_application_2/services.dart/app_routes.dart';
import 'package:flutter_application_2/services.dart/firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
//import 'package:flutter_application_2/auth/login.dart';
//import 'package:flutter_application_2/BodyView.dart';
// Import the generated file
//import 'auth/login.dart';
//import 'firebase_options.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Future.delayed(const Duration(seconds: 5));
  FlutterNativeSplash.remove();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(
          navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.black,
        indicatorColor: Colors.blueGrey,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        labelTextStyle: MaterialStateProperty.resolveWith((states) =>
            states.contains(MaterialState.selected)
                ? TextStyle(color: Colors.blueGrey)
                : TextStyle()),
      )),
      initialRoute: '/',
      getPages: AppRoutes.pages,
      debugShowCheckedModeBanner: false,
      //home: WelcomePage(),
      // home: AuthGate(),
      //home: PageView1(),
    );
  }
}
