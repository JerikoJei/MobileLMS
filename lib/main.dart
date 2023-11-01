import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_app/firebase_options.dart';
import 'package:lms_app/provider/bottom_nav_provider.dart';
import 'package:lms_app/provider/course_provider.dart';
import 'package:lms_app/provider/search_course_provider.dart';
import 'package:lms_app/view/widget/nav_bar_widget.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => BottomNavProvider(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => CourseProvider(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => SearchCourseProvider(),
          )
        ],
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              textTheme: TextTheme(
                titleLarge: GoogleFonts.roboto(
                  fontSize: 25,
                ),
              ),
            ),
            home: const NavBarWidget(),
          );
        });
  }
}
