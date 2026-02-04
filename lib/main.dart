import 'package:flutter/material.dart';
import 'package:flutter_donation/app_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  final appRouter = AppRouter();
  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Donation',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green.shade900,
          primary: Colors.green.shade600,
        ),
      ),
      routerConfig: appRouter.router,
    );
  }
}
