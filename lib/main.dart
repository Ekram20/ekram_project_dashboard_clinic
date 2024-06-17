import 'package:ekram_project_dashboard_clinic/models/appColors.dart';
import 'package:ekram_project_dashboard_clinic/screens/onboarding_screen.dart';
import 'package:ekram_project_dashboard_clinic/screens/subscribe_to_the_system.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:flutter/services.dart';

void main() async{
  runApp(const MyApp()); WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.remove();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool("onboarding")??false;
  runApp( MyApp(onboarding: onboarding,));
}

class MyApp extends StatelessWidget {
  final bool onboarding ;
  const MyApp({super.key,  this.onboarding = false});

  @override
  Widget build(BuildContext context) {
    //fullness screen
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor:AppColors.primaryColor,
        fontFamily: 'ElMessiri',
        focusColor: AppColors.greyColor.shade600,
        buttonTheme: ButtonThemeData(
          buttonColor: AppColors.primaryColor.shade100,
        ),
        iconTheme: IconThemeData(
          color: AppColors.greyColor.shade700,
          size: 24
        ),


        

      ),
      initialRoute: '/',
      routes: {
        //'/': (context) => const SplashScreen(),
   
        '/OnBoarding': (context) => const OnBoardingView(),
    
        
      },

    home:
    SubscribeToTheSystemScreen(),
      //  OnBoardingView()
    // LoginScreen()
    //onboarding? LoginScreen() : const OnBoardingView(),
      // MainScreen()

    );
}

}