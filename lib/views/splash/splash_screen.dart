import 'package:bloc_cleancode_example/config/components/round_button.dart';
import 'package:bloc_cleancode_example/config/routes/routes_name.dart';
import 'package:bloc_cleancode_example/services/splash/splash_services.dart';
import 'package:flutter/material.dart';
import '../../config/components/internet_exception_widget.dart';
import '../../data/exceptions/app_exceptions.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices _splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Splash Screen',style: TextStyle(fontSize: 30),),
        ),
      ),
    );
  }
}
