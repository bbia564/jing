import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menstrual_record/db_menstrual/db_menstrual.dart';
import 'package:menstrual_record/pages/menstrual_birthday/menstrual_birthday_binding.dart';
import 'package:menstrual_record/pages/menstrual_birthday/menstrual_birthday_view.dart';
import 'package:menstrual_record/pages/menstrual_first/menstrual_first_binding.dart';
import 'package:menstrual_record/pages/menstrual_first/menstrual_first_view.dart';
import 'package:menstrual_record/pages/menstrual_pregnant/menstrual_pregnant_binding.dart';
import 'package:menstrual_record/pages/menstrual_pregnant/menstrual_pregnant_view.dart';
import 'package:menstrual_record/pages/menstrual_second/menstrual_second_binding.dart';
import 'package:menstrual_record/pages/menstrual_second/menstrual_second_view.dart';
import 'package:menstrual_record/pages/menstrual_select/menstrual_select_binding.dart';
import 'package:menstrual_record/pages/menstrual_select/menstrual_select_view.dart';
import 'package:menstrual_record/pages/menstrual_tab/menstrual_tab_binding.dart';
import 'package:menstrual_record/pages/menstrual_tab/menstrual_tab_view.dart';
import 'package:menstrual_record/pages/no_network/no_network_binding.dart';
import 'package:menstrual_record/pages/no_network/no_network_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color primaryColor = const Color(0xffff5a8d);
Color bgColor = const Color(0xffffedf3);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBMenstrual().init());
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> select = prefs.getStringList('menstrualSelect') ?? [];
  runApp(MyApp(select: select.isNotEmpty,));
}

class MyApp extends StatelessWidget {
  const MyApp({this.select = false,super.key});
  final bool select;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Jings,
      initialRoute: select ? '/tab' : '/birthday',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Jings = [
  GetPage(name: '/uninit', page: () => NoNetworkPage(), binding: NoNetworkBinding()),
  GetPage(name: '/tab', page: () => MenstrualTabPage(), binding: MenstrualTabBinding()),
  GetPage(name: '/select', page: () => MenstrualSelectPage(), binding: MenstrualSelectBinding()),
  GetPage(name: '/first', page: () => MenstrualFirstPage(), binding: MenstrualFirstBinding()),
  GetPage(name: '/second', page: () => MenstrualSecondPage(), binding: MenstrualSecondBinding()),
  GetPage(name: '/pregnant', page: () => MenstrualPregnantPage(), binding: MenstrualPregnantBinding()),
  GetPage(name: '/birthday', page: () => MenstrualBirthdayPage(), binding: MenstrualBirthdayBinding()),
];
