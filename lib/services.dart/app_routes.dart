//import 'package:flutter_application_2/onbording.dart';
//import 'package:flutter_application_2/presentation/pages/Profile/widgets/profileview.dart';
// import 'package:flutter_application_2/presentation/pages/auth/auth_gate.dart';
// import 'package:flutter_application_2/presentation/pages/auth/login.dart';
//import 'package:flutter_application_2/presentation/pages/auth/contact_form.dart';
//import 'package:flutter_application_2/presentation/pages/auth/pageview.dart';
//import 'package:flutter_application_2/presentation/pages/auth/welcome.dart';
//import 'package:flutter_application_2/presentation/pages/home/home_view.dart';
//import 'package:flutter_application_2/presentation/pages/upload_post/post_view.dart';
//import 'package:flutter_application_2/reelspage.dart';
import 'package:get/get.dart';

//import 'presentation/pages/auth/sign_up.dart';
import '../auth.dart/auth_gate.dart';
import '../auth.dart/login.dart';
import '../screens.dart/pageview.dart';
import '../screens.dart/welcomepage.dart';
//import 'presentation/pages/auth/welcomepage.dart';

class AppRoutes {
  static var pages = [
    GetPage(
      name: '/',
      page: () => AuthGate(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: '/welcome',
      page: () => welcomeScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: '/onboarding',
      page: () => PageView1(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: '/login',
      page: () => Login(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 500),
    ),
  ];
}
