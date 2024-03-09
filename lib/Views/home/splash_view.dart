import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:sales_management_system/Views/auth/login.dart';
import 'package:sales_management_system/Views/home/dashboard.dart';

class SplashScreen extends StatefulWidget {
 @override
 _SplashScreenState createState() => _SplashScreenState();
}
final LocalStorage storage = new LocalStorage('app');

class _SplashScreenState extends State<SplashScreen> {
//  final LocalStorage storage = new LocalStorage('app');
 final ValueNotifier<bool> isLoggedInNotifier = ValueNotifier<bool>(false);

 @override
 void initState() {
    super.initState();
    _checkAuthStatus();
 }

 Future<void> _checkAuthStatus() async {
    await storage.ready;
    bool isLoggedIn = storage.getItem('isLoggedIn') ?? false;
    isLoggedInNotifier.value = isLoggedIn;
 }

 @override
 Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _checkAuthStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ValueListenableBuilder<bool>(
            valueListenable: isLoggedInNotifier,
            builder: (context, isLoggedIn, child) {
              if (isLoggedIn) {
                return const DashboardPage();
              } else {
                return LoginScreen();
              }
            },
          );
        } else {
          // Show a loading indicator while waiting for the future to complete
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
 }
}