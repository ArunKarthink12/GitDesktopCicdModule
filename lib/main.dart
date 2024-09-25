import 'package:doctor_module/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

//main branch Firstcommit
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        getPages: Routes.routes,
        debugShowCheckedModeBanner: false,
        title: 'Doctor',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
        ),
        color: Colors.cyan,
        home: const AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            systemNavigationBarColor: Colors.black,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          child: SplashScreen(),
        ));
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String token = "";

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      token = pref.getString("isLogin").toString();
      print(token);
      token == "true" ? Get.toNamed("/bottomnavibar") : Get.toNamed("/login");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 239, 239),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage(
                "images/docto_sample_logo1.jpg",
              ),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
